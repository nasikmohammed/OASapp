import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myproject/models/userdetails.dart';
import 'package:myproject/view/home.dart';
import 'package:myproject/viewmodel/userstore.dart';

class ControllerProvider extends ChangeNotifier {
  String imageurl = '';
  String profilepick = '';
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
  // user profile update controller
  TextEditingController updateusername = TextEditingController();
  TextEditingController updateuseroccupation = TextEditingController();
  TextEditingController updateuseraddress = TextEditingController();
  TextEditingController updateuserdob = TextEditingController();
  TextEditingController updateuserphonenumber = TextEditingController();
  TextEditingController updateuseremail = TextEditingController();
  //user profile
  String userName = '';
  String useraddress = '';
  String userdob = '';
  String userphonenumber = '';
  String useroccupation = '';
  String useremail = '';
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
                    profile: profilepick,
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
  } //update user profile

  Future<void> userprofileupdate(context, String name, occupation, address, dob,
      phonenumber, email) async {
    updateusername.text = name;
    updateuseroccupation.text = occupation;
    updateuseraddress.text = address;
    updateuserdob.text = dob;
    updateuserphonenumber.text = phonenumber;
    updateuseremail.text = email;

    return showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          width: 250,
          child: AlertDialog(
            title: Center(
              child: Text(
                "Edit Profile",
                style: GoogleFonts.anekDevanagari(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    const Icon(
                      CupertinoIcons.person_alt_circle,
                      color: Colors.grey,
                      size: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 40),
                      child: IconButton(
                          onPressed: () {
                            pickuserprofileimage();
                          },
                          icon: const Icon(
                            Icons.add_a_photo,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ]),
                  TextField(
                    controller: updateusername,
                    style: GoogleFonts.overpass(),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: updateuseroccupation,
                    style: GoogleFonts.overpass(),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        labelText: 'Occupation',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: updateuseraddress,
                    style: GoogleFonts.overpass(),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        labelText: 'Address',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: updateuserdob,
                    style: GoogleFonts.overpass(),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        labelText: 'DOB',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: updateuserphonenumber,
                    style: GoogleFonts.overpass(),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        labelText: 'PhoneNumber',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: updateuseremail,
                    style: GoogleFonts.overpass(),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        labelText: 'email',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.nunito(color: Colors.white),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.indigo),
                  onPressed: () {
                    print("update");
                    update();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Update",
                    style: GoogleFonts.nunito(color: Colors.white),
                  )),
            ],
          ),
        );
      },
    );
  }

  update() {
    final DocumentReference<Map<String, dynamic>> user = FirebaseFirestore
        .instance
        .collection("User Details")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    user.update({
      "fullname": updateusername.text,
      "occupation": updateuseroccupation.text,
      "address": updateuseraddress.text,
      "dob": updateuserdob.text,
      "phone": updateuserphonenumber.text,
      "email": updateuseremail.text,
    });
  }

  pickuserprofileimage() async {
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
      profilepick = await referencetoimageupload.getDownloadURL();
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
