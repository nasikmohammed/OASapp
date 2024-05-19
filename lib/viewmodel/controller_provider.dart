import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myproject/view/home.dart';
import 'package:myproject/view/otp.dart';

class ControllerProvider extends ChangeNotifier {
  String imageurl = '';
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
  //Otp
  final otp = TextEditingController();
  //Bidvalue
  TextEditingController bidvaluecontroller = TextEditingController();

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
}
