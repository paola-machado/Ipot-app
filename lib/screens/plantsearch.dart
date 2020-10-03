import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Ipot/models/plant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animations/loading_animations.dart';

class PlantSearch extends StatefulWidget {
  @override
  _PlantSearchState createState() => _PlantSearchState();
}

class _PlantSearchState extends State<PlantSearch>
    with SingleTickerProviderStateMixin {
  PageController _pageController;

  Future getPlants() async {
    CollectionReference firestore =
        FirebaseFirestore.instance.collection("plants");
    QuerySnapshot qn = await firestore.get();
    return qn.docs;
  }

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
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      child: getFutureBuilder(),
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

  Widget getFutureBuilder() {
    return FutureBuilder(
      future: getPlants(),
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
                Plant planta =
                    new Plant().fromJson(snapshot.data[index].data());

                return ListTile(
                  title: Text(planta.nomeComum),
                  onTap: () => navigateToDetail(planta),
                );
              },
            ),
          );
        }
      },
    );
  }
}

class PlantDetail extends StatefulWidget {
  final Plant plant;
  const PlantDetail({Key key, this.plant}) : super(key: key);

  @override
  _PlantDetailState createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
  @override
  Widget build(BuildContext context) {
    print(widget.plant.imageUrl);
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: 60.0,
                    ),
                    height: 520.0,
                    color: Color(0xFF32A060),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back,
                                size: 40.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Nome Popular',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          widget.plant.nomeComum,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Nome Científico',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          widget.plant.nomeCientifico,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Umidade',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          widget.plant.quantiaAgua,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Luminosidade',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          widget.plant.quantiaSol,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Positioned(
                          right: 20.0,
                          bottom: 30.0,
                          child: Hero(
                            tag: widget.plant.imageUrl,
                            child: Image.network(widget.plant.imageUrl),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    top: 40.0,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Temperatura',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        widget.plant.temperatura,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
