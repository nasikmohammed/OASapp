import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ControllerProvider extends ChangeNotifier {
  String imageurl = '';
  //ITEMS
  final itemtitlecontroller = TextEditingController();
  final itemsummerycontroller = TextEditingController();
  final itemdescriptioncontroller = TextEditingController();
  final itemcategorycontroller = TextEditingController();
  final itembaseamountcontroller = TextEditingController();
  final itemdurationcontroller = TextEditingController();
  //SERVICE
  final servicetitlecontroller = TextEditingController();
  final servicesummerycontroller = TextEditingController();
  final servicedescriptioncontroller = TextEditingController();
  final servicecategorycontroller = TextEditingController();
  final servicebaseamountcontroller = TextEditingController();
  final servicedurationcontroller = TextEditingController();

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
  }claerservicefield() {
    servicetitlecontroller.clear();
    servicesummerycontroller.clear();
    servicedescriptioncontroller.clear();
    servicecategorycontroller.clear();
    servicebaseamountcontroller.clear();
    servicedurationcontroller.clear();
    imageurl = "";
  }
}
