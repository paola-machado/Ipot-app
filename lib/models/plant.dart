/*import 'package:Ipot/models/plantmodel.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Plant _PlantFromJson(Map<String, dynamic> json){
  return Plant(
      json['nomeComum'] as String;
      imageUrl: json['imageUrl'] as String;
      nomeCientifico: json['nomeCientifico'] as String;
      quantiaAgua: json['quantiaAgua'] as String;
      quantiaSol: json['quantiaSol'] as String;
      temperatura: json['temperatura'] as String;
  );
}

Map<String, dynamic> _PlantToJson(Plant instance) => <String, dynamic>  {
  'imageUrl': instance.imageUrl,
  'nomeComum': instance.nomeComum,
  'nomeCientifico': instance.nomeCientifico,
  'quantiaAgua': instance.quantiaAgua,
  'quantiaSol': instance.quantiaSol,
  'temperatura': instance.temperatura,
};

*/
class Plant {
  String nomeComum;
  String imageUrl;
  String nomeCientifico;
  String quantiaAgua;
  String quantiaSol;
  String temperatura;
  // DocumentReference reference;

  /* Plant(this.nomeComum,
      {this.imageUrl, this.nomeCientifico, this.quantiaAgua, this.quantiaSol, this.temperatura, this.reference});*/

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'nome': nomeComum,
      'nomeCientifico': nomeCientifico,
      'quantiaAgua': quantiaAgua,
      'quantiaSol': quantiaSol,
      'temperatura': temperatura
    };
  }

  fromJson(Map<String, dynamic> map) {
    imageUrl = map['imageUrl'];
    nomeComum = map['nomeComum'];
    nomeCientifico = map['nomeCientifico'];
    quantiaAgua = map['quantiaAgua'];
    quantiaSol = map['quantiaSol'];
    temperatura = map['temperatura'];
    return this;
  }
}
/*
  factory Plant.fromSnapshot(DocumentSnapshot snapshot) {
    Plant newPlant = Plant.fromJson(snapshot.data);
    newPlant.reference = snapshot.reference;
    return newPlant;
  }

  factory Plant.fromJson(Map<String, dynamic> json) => _PlantFromJson(json);

  Map<String, dynamic> toJson() => _PlantToJson(this);

  @override
  String toString() => "Plants<$nomeComum>";
}*/
/* Widget build(BuildContext context) {
    CollectionReference plants = FirebaseFirestore.instance.collection('plants');

    Future<void> addPlant() {
      return plants
          .add({
        'imageUrl': imageUrl,
        'nome': nomeComum,
        'nomeCientifico': nomeCientifico,
        'quantiaAgua': quantiaAgua,
        'quantiaSol': quantiaSol,
        'temperatura': temperatura
      })
          .then((value) => print("Plant Added"))
          .catchError((error) => print("Failed to add plant: $error"));
    }

    return FlatButton(
      onPressed: addPlant,
      child: Text(
        "Add Plant",
      ),
    );
  }
*/
