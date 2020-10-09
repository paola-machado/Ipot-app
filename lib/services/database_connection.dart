import 'package:Ipot/models/plant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseConnection {
  CollectionReference firestore =
      FirebaseFirestore.instance.collection("plants");

  Future getAllPlants(String search) async {
    QuerySnapshot qn;
    qn = await firestore.get();

    return qn.docs;
  }

  Future getOnlyActivePlants() async {
    QuerySnapshot qn = await firestore.where("ativo", isEqualTo: true).get();
    return qn.docs;
  }

  Stream<QuerySnapshot> getByFilter() {
    return firestore.snapshots();
  }

  void updatePlant(Plant plant) {
    firestore.doc(plant.uid).set(plant.toJson(), SetOptions(merge: true));
  }

  void addNewPlant(Plant plant) {
    firestore.add(plant.toJson());
  }

  void deletePlant(Plant plant){
    firestore.doc(plant.uid).delete();
  }

}
