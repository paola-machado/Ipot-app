import 'package:Ipot/models/plant.dart';
import 'package:Ipot/screens/arduinoscreen.dart';
import 'package:Ipot/screens/plantdetail.dart';
import 'package:Ipot/services/database_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Ipot/screens/plantsearch.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  int _selectedPage = 0;
  Plant plant;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  _plantSelector(int index, dynamic data) {
    plant = getPlantFromMap(data);
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PlantDetail(plant: plant),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF32A060),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Image(
                      height: 250.0,
                      width: 250.0,
                      image: AssetImage(
                        'assets/images/potted-plant.png',
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    left: 30.0,
                    bottom: 40.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'NOME',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          data['nomeComum'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF32A060),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            color: Colors.white,
            iconSize: 30.0,
            tooltip: 'Add new plant',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlantSearch()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              decoration: BoxDecoration(
                  color: Color(0xFF32A060),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/menu.jpg'))),
            ),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text('Nova planta'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.wifi_rounded),
              title: Text('Controle Vaso'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArduinoScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            FutureBuilder(
              future: DatabaseConnection().getOnlyActivePlants(),
              builder: (_, snapshot) {
                if (!snapshot.hasData) return Container();
                return Container(
                  height: 500.0,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int index) {
                      setState(() {
                        _selectedPage = index;
                      });
                    },
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _plantSelector(index, snapshot.data[index]);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  getPlantFromMap(data) {
    return new Plant().fromJson(data.data(), data.documentID);
  }
}
