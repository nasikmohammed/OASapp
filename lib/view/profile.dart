import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
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
          });
        }
      }
    } catch (e) {
      print('Error fetching user details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 230, 187),
        title: const Text('Profile  '),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 600,
                    height: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Color.fromARGB(255, 235, 230, 187),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.person_alt_circle,
                          size: 130,
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        left: 160,
                        top: 70,
                      ),
                      child: Column(
                        children: [
                          Text(
                            userName,
                            style: GoogleFonts.kalam(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(useroccupation,
                              style: GoogleFonts.aleo(
                                  fontWeight: FontWeight.bold)),
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Column(
                children: [
                  Text(
                    "Address",
                    style: GoogleFonts.kalam(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(useraddress,
                      style: GoogleFonts.aleo(fontWeight: FontWeight.bold)),
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
                      style: GoogleFonts.aleo(fontWeight: FontWeight.bold)),
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
                      style: GoogleFonts.aleo(fontWeight: FontWeight.bold)),
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
                      style: GoogleFonts.aleo(fontWeight: FontWeight.bold)),
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
                height: 70,
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
  }
}
