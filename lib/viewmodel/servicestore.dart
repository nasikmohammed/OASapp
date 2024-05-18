import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myproject/models/items.dart';

class Servicestore {
  final db = FirebaseFirestore.instance;
  final CollectionReference servicecollection =
      FirebaseFirestore.instance.collection("Service");
  Future addservice(Servicemodel servicesmodel) async {
    final doc = db.collection("Service").doc();

    doc.set(servicesmodel.toJson());
  }
}
