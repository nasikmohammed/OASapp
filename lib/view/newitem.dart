import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myproject/components/my_textfield.dart';
import 'package:myproject/models/items.dart';
import 'package:myproject/view/home.dart';
import 'package:myproject/viewmodel/controller_provider.dart';
import 'package:myproject/viewmodel/itemservice.dart';
import 'package:provider/provider.dart';

class NewItem extends StatefulWidget {
  const NewItem({Key? key}) : super(key: key);

  @override
  State<NewItem> createState() => __NewItemState();
}

class __NewItemState extends State<NewItem> {
  List<File?> images = [];
  final ImagePicker _picker = ImagePicker();
  var imageurl = '';

  @override
  Widget build(BuildContext context) {
    itemeService items = itemeService();
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
                    controller: ctrl.itemtitlecontroller,
                    hintText: 'Title',
                    obscureText: false),
                MyTextField(
                    controller: ctrl.itemsummerycontroller,
                    hintText: 'Summary',
                    obscureText: false),
                MyTextField(
                    controller: ctrl.itemdescriptioncontroller,
                    hintText: 'Detailed Description',
                    obscureText: false),
                MyTextField(
                    controller: ctrl.itemcategorycontroller,
                    hintText: 'Category',
                    obscureText: false),
                MyTextField(
                    controller: ctrl.itembaseamountcontroller,
                    hintText: 'Base Amount',
                    obscureText: false),
                MyTextField(
                    sufix: IconButton(
                        onPressed: () {
                          ctrl.datepickforduration(context);
                        },
                        icon: Icon(Icons.calendar_month)),
                    controller: ctrl.itemdurationcontroller,
                    hintText: 'Duration',
                    obscureText: false),
                GestureDetector(
                  onTap: () {
                    items
                        .additem(Items(
                      title: ctrl.itemtitlecontroller.text,
                      summary: ctrl.itemsummerycontroller.text,
                      expiry: ctrl.itemdurationcontroller.text,
                      baseamount: ctrl.itembaseamountcontroller.text,
                      imagepath: imageurl,
                      category: ctrl.itemcategorycontroller.text,
                      detaileddescription: ctrl.itemdescriptioncontroller.text,
                    ))
                        .then(
                      (value) {
                        Fluttertoast.showToast(
                            msg: "successfully uploaded",
                            backgroundColor: Color.fromARGB(255, 0, 2, 2),
                            webShowClose: true);
                      },
                    );
                    ctrl.claeritemfield();
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




// void main() {
//   runApp(MaterialApp(
//     home: NewItem(),
//   ));
// }
