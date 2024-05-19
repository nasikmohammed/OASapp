import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myproject/models/items.dart';

class Bidstore {
  final db = FirebaseFirestore.instance;
  final CollectionReference servicecollection =
      FirebaseFirestore.instance.collection("Highest bid");
  Future addBid(BidModel bidmodel) async {
    final doc = db.collection("Highest bid").doc();

    doc.set(bidmodel.toJson());
  }
}