import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myproject/models/items.dart';

class itemeService {
  final db = FirebaseFirestore.instance;
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection("Items");
  Future additem(Items itemsmodel) async {
    final doc = db.collection("Items").doc();

    doc.set(itemsmodel.toJson());
  }
  
}
