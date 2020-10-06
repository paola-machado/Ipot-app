import 'package:Ipot/screens/plantdetail.dart';
import 'package:Ipot/services/database_connection.dart';
import 'package:Ipot/models/plant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class PlantSearch extends StatefulWidget {
  @override
  _PlantSearchState createState() => _PlantSearchState();
}

class _PlantSearchState extends State<PlantSearch>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  navigateToDetail(Plant plant) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlantDetail(plant: plant),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String search = "";

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 60.0,
                ),
                height: 670.0,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back,
                            size: 30.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          search = value;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      child: getFutureBuilder(search),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getFutureBuilder(String search) {
    return FutureBuilder(
      future: DatabaseConnection().getAllPlants(search),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text("Something went wrong"),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingFadingLine.circle(
              backgroundColor: Colors.green,
            ),
          );
        } else {
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Plant planta = getPlantFromMap(snapshot, index);
                return ListTile(
                  title: Text(snapshot.data[index].data()['nomeComum']),
                  onTap: () => navigateToDetail(planta),
                );
              },
            ),
          );
        }
      },
    );
  }

  getPlantFromMap(snapshot, index) {
    return new Plant()
        .fromJson(snapshot.data[index].data(), snapshot.data[index].documentID);
  }
}
