import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myproject/models/userdetails.dart';

class Userstore
 {
  final db = FirebaseFirestore.instance;
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection("User Details");
  Future adduserdetails(UserModel usermodel,uid) async {
    final doc = db.collection("User Details").doc(uid);

    doc.set(usermodel.toJson(uid));
  }
  
}