import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myproject/models/items.dart';
import 'package:random_string/random_string.dart';

class itemeService {
  final db = FirebaseFirestore.instance;
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection("Items");
       String id = randomAlphaNumeric(10);
  Future additem(Items itemsmodel,uid,id) async {
    final doc = db.collection("Items").doc(id);

    doc.set(itemsmodel.toJson(doc.id));
  }
  
}
