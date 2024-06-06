import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myproject/models/userdetails.dart';
import 'package:myproject/view/home.dart';
import 'package:myproject/viewmodel/userstore.dart';

class ControllerProvider extends ChangeNotifier {
  String imageurl = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  Userstore userstore = Userstore();

  //ITEMS
  final itemtitlecontroller = TextEditingController();
  final itemsummerycontroller = TextEditingController();
  final itemdescriptioncontroller = TextEditingController();
  final itemcategorycontroller = TextEditingController();

  TextEditingController itembaseamountcontroller = TextEditingController();
  final itemdurationcontroller = TextEditingController();
  //SERVICE
  final servicetitlecontroller = TextEditingController();
  final servicesummerycontroller = TextEditingController();
  final servicedescriptioncontroller = TextEditingController();
  final servicecategorycontroller = TextEditingController();
  final servicebaseamountcontroller = TextEditingController();
  final servicedurationcontroller = TextEditingController();
  // register
  final fullname = TextEditingController();
  final address = TextEditingController();
  final occupation = TextEditingController();
  final phone = TextEditingController();
  final dob = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();

  //Otp
  final otp = TextEditingController();
  //Bidvalue
  TextEditingController bidvaluecontroller = TextEditingController();
  //login
  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();

  pickimagefromgallery() async {
    ImagePicker imagePicker = ImagePicker();
    SettableMetadata metadata = SettableMetadata(contentType: "image/jpeg");
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    print(".................${file?.path}");
    if (file == null) return;
    String uniquefilename = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referencRoot = FirebaseStorage.instance.ref();
    Reference referencedirimage = referencRoot.child("images");
    Reference referencetoimageupload = referencedirimage.child(uniquefilename);
    try {
      await referencetoimageupload.putFile(File(file.path), metadata);
      imageurl = await referencetoimageupload.getDownloadURL();
    } catch (error) {
      print(error);
    }
  }

  claeritemfield() {
    itemtitlecontroller.clear();
    itemsummerycontroller.clear();
    itemdescriptioncontroller.clear();
    itemcategorycontroller.clear();
    itembaseamountcontroller.clear();
    itemdurationcontroller.clear();
    imageurl = "";
  }

  claerservicefield() {
    servicetitlecontroller.clear();
    servicesummerycontroller.clear();
    servicedescriptioncontroller.clear();
    servicecategorycontroller.clear();
    servicebaseamountcontroller.clear();
    servicedurationcontroller.clear();
    imageurl = "";
  }

  clearbid() {
    bidvaluecontroller.clear();
  }

  datepickfordob(context) async {
    final DateTime? selecteddate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    final formatteddate = DateFormat("dd/MM/yyyy").format(selecteddate!);

    print(formatteddate);

    dob.text = formatteddate.toString();
    notifyListeners();
  }

  datepickforduration(context) async {
    final DateTime? selectedtime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    final formattedtime = DateFormat("dd/MM/yyyy").format(selectedtime!);

    print(formattedtime);

    itemdurationcontroller.text = formattedtime.toString();
    notifyListeners();
  }

  /////////////////////
  Future signupwituser(context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        String uid = value.user!.uid;

        userstore
            .adduserdetails(
                UserModel(
                    fullname: fullname.text,
                    address: address.text,
                    occupation: occupation.text,
                    phone: phone.text,
                    dob: dob.text,
                    password: password.text,
                    email: email.text,
                    id: uid),
                uid)
            .then(
          (value) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomeP(
                currentIndex: 0,
              ),
            ));
          },
        );

        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  //loging with user
  Loginwithuser(context) async {
    print("object");
    try {
      await auth
          .signInWithEmailAndPassword(
              email: loginemail.text, password: loginpassword.text)
          .then(
        (credential) {
          String id = credential.user!.uid;

          print(id);
          final snackBar = SnackBar(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            content: Text(
              "Login Succesfully",
              style: GoogleFonts.sarabun(),
            ),
          );

          // Display the Snackbar
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return HomeP(
                currentIndex: 0,
              );
            },
          ));
        },
      );
    } catch (e) {
      print("ccccccccccccccccccccccccccccccc");
      print(e.toString());
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Check Your Emai and Password",
          style: GoogleFonts.plusJakartaSans(),
        ),
        action: SnackBarAction(
          label: 'Undo',
          textColor: const Color.fromARGB(255, 0, 0, 0),
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Display the Snackbar
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
