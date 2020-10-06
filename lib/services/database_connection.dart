import 'package:Ipot/models/plant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseConnection {
  CollectionReference firestore =
      FirebaseFirestore.instance.collection("plants");

  Future getAllPlants(String search) async {
    QuerySnapshot qn;
    if (search.isEmpty) {
      qn = await firestore.get();
    } else {
      qn = await firestore.where('nomeComum', isEqualTo: search).get();
    }
    return qn.docs;
  }

  Future getOnlyActivePlants() async {
    QuerySnapshot qn = await firestore.where("ativo", isEqualTo: true).get();
    return qn.docs;
  }

  void updatePlant(Plant plant) {
    firestore.doc(plant.uid).set(plant.toJson(), SetOptions(merge: true));
  }
}
