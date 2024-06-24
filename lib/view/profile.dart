import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/viewmodel/controller_provider.dart';
import 'package:provider/provider.dart';

class ScreenUserProfile extends StatefulWidget {
  @override
  _ScreenUserProfileState createState() => _ScreenUserProfileState();
}

class _ScreenUserProfileState extends State<ScreenUserProfile> {
  String userName = '';
  String useraddress = '';
  String userdob = '';
  String userphonenumber = '';
  String useroccupation = '';
  String useremail = '';
  String userprofile = '';
  Stream<Map<String, dynamic>> fetchUserDetails() async* {
    // final ctrl = Provider.of<ControllerProvider>(context);

    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Get the user details from Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('User Details')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          setState(() {
            userName = userDoc['fullname'];
            useraddress = userDoc['address'];
            userdob = userDoc['dob'];
            userphonenumber = userDoc['phone'];
            useremail = userDoc['email'];
            useroccupation = userDoc['occupation'];
            userprofile = userDoc['profile'];
          });
        }
      }
    } catch (e) {
      print('Error fetching user details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<ControllerProvider>(context);

    return StreamBuilder<Map<String, dynamic>>(
      stream: fetchUserDetails(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 235, 230, 187),
            title: Text(
              'Profile  ',
              style: GoogleFonts.rubikDoodleShadow(),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 600,
                        height: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Color.fromARGB(255, 235, 230, 187),
                        ),
                      ),
                      userprofile == ""
                          ? Icon(
                              CupertinoIcons.person_alt_circle,
                              size: 120,
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    NetworkImage(userprofile, scale: 1),
                              ),
                            ),
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 180,
                          ),
                          child: Column(
                            children: [
                              Text(
                                userName,
                                style: GoogleFonts.kalam(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(useroccupation,
                                  style: GoogleFonts.ysabeau(
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 8),
                    child: SizedBox(
                        height: 30,
                        width: 120,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 235, 230, 187),
                            ),
                            onPressed: () {
                              ctrl.userprofileupdate(
                                  context,
                                  userName,
                                  useroccupation,
                                  useraddress,
                                  userdob,
                                  userphonenumber,
                                  useremail);
                            },
                            child: Text(
                              'Edit Profile',
                              style: GoogleFonts.ysabeau(
                                  fontSize: 13, color: Colors.black),
                            ))),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      Text(
                        "Address",
                        style: GoogleFonts.kalam(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(useraddress,
                          style:
                              GoogleFonts.ysabeau(fontWeight: FontWeight.bold)),
                      const Divider(
                        endIndent: 30,
                        indent: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Date of Birth",
                        style: GoogleFonts.kalam(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(userdob,
                          style:
                              GoogleFonts.ysabeau(fontWeight: FontWeight.bold)),
                      const Divider(
                        endIndent: 30,
                        indent: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Phone Number",
                        style: GoogleFonts.kalam(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(userphonenumber,
                          style:
                              GoogleFonts.ysabeau(fontWeight: FontWeight.bold)),
                      const Divider(
                        endIndent: 30,
                        indent: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email",
                        style: GoogleFonts.kalam(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(useremail,
                          style:
                              GoogleFonts.ysabeau(fontWeight: FontWeight.bold)),
                      const Divider(
                        endIndent: 30,
                        indent: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 600,
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Color.fromARGB(255, 235, 230, 187),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
