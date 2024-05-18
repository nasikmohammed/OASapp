import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myproject/models/userdetails.dart';

class Userstore
 {
  final db = FirebaseFirestore.instance;
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection("User Details");
  Future adduserdetails(UserModel usermodel) async {
    final doc = db.collection("User Details").doc();

    doc.set(usermodel.toJson());
  }
  
}