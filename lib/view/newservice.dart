import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myproject/components/my_textfield.dart';
import 'package:myproject/models/items.dart';
import 'package:myproject/view/home.dart';
import 'package:myproject/viewmodel/controller_provider.dart';
import 'package:myproject/viewmodel/servicestore.dart';
import 'package:provider/provider.dart';

class NewService extends StatefulWidget {
  const NewService({super.key});

  @override
  State<NewService> createState() => _NewServiceState();
}

class _NewServiceState extends State<NewService> {
  List<File?> images = [];
  final ImagePicker _picker = ImagePicker();
  var imageurl = '';
  Servicestore _servicestore = Servicestore();

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<ControllerProvider>(context);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 248, 227),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    pickImages();
                  },
                  child: Container(
                    height: 133,
                    width: 133,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(54, 105, 240, 175),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.image,
                      size: 33,
                    ),
                  ),
                ),
                Column(
                  children: images
                      .map((image) => image == null
                          ? const Text("No Image selected")
                          : Image.file(image))
                      .toList(),
                ),
                MyTextField(
                  hintText: 'Title',
                  obscureText: false,
                  controller: ctrl.servicetitlecontroller,
                ),
                MyTextField(
                  hintText: 'Summary',
                  obscureText: false,
                  controller: ctrl.servicesummerycontroller,
                ),
                MyTextField(
                  hintText: 'Detailed Description',
                  obscureText: false,
                  controller: ctrl.servicedescriptioncontroller,
                ),
                MyTextField(
                  hintText: 'Category',
                  obscureText: false,
                  controller: ctrl.servicecategorycontroller,
                ),
                MyTextField(
                  hintText: 'Base Amount',
                  obscureText: false,
                  controller: ctrl.servicebaseamountcontroller,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 15),
                  child: TextFormField(
                    controller: ctrl.servicedurationcontroller,
                    readOnly: true,
                    onTap: () => ctrl.selectDateTimeforservice(context),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Duration',
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _servicestore.addservice(Servicemodel(
                        title: ctrl.servicetitlecontroller.text,
                        description: ctrl.servicedescriptioncontroller.text,
                        summery: ctrl.servicesummerycontroller.text,
                        baseamount: ctrl.servicebaseamountcontroller.text,
                        imagepath: imageurl,
                        category: ctrl.servicecategorycontroller.text,
                        duration: ctrl.servicedurationcontroller.text));
                    ctrl.claerservicefield();
                    Fluttertoast.showToast(
                        msg: "successfully uploaded",
                        backgroundColor: Color.fromARGB(255, 0, 2, 2),
                        webShowClose: true);
                  },
                  child: Container(
                    width: 320,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadiusDirectional.circular(10),
                    ),
                    padding: const EdgeInsets.all(9),
                    child: const Center(
                        child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Color.fromARGB(255, 199, 237, 255),
                          fontSize: 17),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: MyBottomNavBar(
          currentIndex: 2,
          onTap: (p0) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeP(
                      currentIndex: p0,
                    )));
          },
        ));
  }

  Future<void> pickImages() async {
    final List<XFile?> pickedFiles = await _picker.pickMultiImage();
    for (XFile? pickedFile in pickedFiles) {
      if (pickedFile != null) {
        images.add(File(pickedFile.path));
      }
      var uniquefilename = DateTime.now().millisecondsSinceEpoch.toString();
      Reference referencRoot = FirebaseStorage.instance.ref();
      Reference referencedirimage = referencRoot.child("images");
      Reference referencetoimageupload =
          referencedirimage.child(uniquefilename);
      try {
        await referencetoimageupload.putFile(
          File(pickedFile!.path),
        );
        imageurl = await referencetoimageupload.getDownloadURL();
      } catch (error) {
        print(error);
      }
    }
    setState(() {});
  }
}
