import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< HEAD
import 'package:Ipot/models/plant.dart';
=======
import 'package:firebase_core/firebase_core.dart';
>>>>>>> 1e0ff42d655819bf02e1f2f869a7904d396a4d59
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animations/loading_animations.dart';

class PlantSearch extends StatefulWidget {
  @override
  _PlantSearchState createState() => _PlantSearchState();
}

<<<<<<< HEAD
class _PlantSearchState extends State<PlantSearch> with SingleTickerProviderStateMixin {

 Future getPlants() async {
    CollectionReference firestore = FirebaseFirestore.instance.collection('plants');
=======
class _PlantSearchState extends State<PlantSearch>
    with SingleTickerProviderStateMixin {
  PageController _pageController;

  Future getPlants() async {
    CollectionReference firestore =
        FirebaseFirestore.instance.collection("Plantas");
>>>>>>> 1e0ff42d655819bf02e1f2f869a7904d396a4d59
    QuerySnapshot qn = await firestore.get();
    return qn.docs;
  }

  /*navigateToDetail(DocumentSnapshot, plant){
    Navigator.push(context, MaterialPageRoute(builder: (context) => PlantDetail(plant: plant,)))

  }*/

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
                height: 650.0,
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
<<<<<<< HEAD
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
                          borderRadius:
                          BorderRadius.all(Radius.circular(25.0)),
=======
                        SizedBox(height: 20.0),
                        TextField(
                          //add focus node? eventually? maybe??
                          decoration: InputDecoration(
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)))),
                        ),
                        SizedBox(height: 200.0),
                        Container(
                          child: getFutureBuilder(),
>>>>>>> 1e0ff42d655819bf02e1f2f869a7904d396a4d59
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      //height: 600,
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
<<<<<<< HEAD

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
                //shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(Plant().fromJson(snapshot.data[index]).data['nomeComum']),
                    //onTap: () => navigateToDetail(snapshot.data[index]),
                  );
                }
                ),
          );
        }
      }
    );
  }
}
/*
=======

  Widget getFutureBuilder() {
    return FutureBuilder(
      future: getPlants(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text(data.toString());
        }

        return Text("loading");
      },
    );
  }
}

>>>>>>> 1e0ff42d655819bf02e1f2f869a7904d396a4d59
class PlantDetail extends StatefulWidget {
  final DocumentSnapshot plant;
  const PlantDetail({Key key, this.plant}) : super(key: key);

  @override
  _PlantDetailState createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
  @override
  Widget build(BuildContext context) {
   return Container(
     child: Card(
       child: ListTile(
        // title: Text(widget.plant.data['nomeComum']),
       ),
     ),
   );
  }
}
<<<<<<< HEAD
*/
=======
>>>>>>> 1e0ff42d655819bf02e1f2f869a7904d396a4d59
