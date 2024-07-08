import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproject/components/my_textfield.dart';
import 'package:myproject/models/userdetails.dart';
import 'package:myproject/view/home.dart';
import 'package:myproject/viewmodel/controller_provider.dart';
import 'package:myproject/viewmodel/userstore.dart';
import 'package:provider/provider.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

Userstore userstore = Userstore();

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<ControllerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_circle_left_outlined)),
        backgroundColor: Color.fromARGB(255, 255, 252, 225),
      ),
      backgroundColor: Color.fromARGB(255, 255, 252, 225),
      body: ListView(
        children: [
          const SizedBox(
            height: 12,
          ),
          const Center(
              child: Text(
            "Let's register now!",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 100,
              right: 100,
            ),
            child: InkWell(
              onTap: () {
                ctrl.pickuserprofileimage();
              },
              child: ctrl.profilepick.isNotEmpty
                  ? Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 203, 197, 197),
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          ctrl.profilepick,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 224, 224, 212),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.add_a_photo,
                        size: 50,
                      ),
                    ),
            ),
          ),
          MyTextField(
            hintText: "full name",
            obscureText: false,
            controller: ctrl.fullname,
          ),
          const SizedBox(
            height: 2,
          ),
          MyTextField(
            hintText: "address",
            obscureText: false,
            controller: ctrl.address,
          ),
          const SizedBox(
            height: 2,
          ),
          MyTextField(
            hintText: "Occupation",
            obscureText: false,
            controller: ctrl.occupation,
          ),
          const SizedBox(
            height: 2,
          ),
          MyTextField(
            hintText: "Phone",
            obscureText: false,
            controller: ctrl.phone,
          ),
          const SizedBox(
            height: 2,
          ),
          MyTextField(
            sufix: IconButton(
                onPressed: () {
                  ctrl.datepickfordob(context);
                },
                icon: Icon(Icons.calendar_month_outlined)),
            hintText: "Date of Birth",
            obscureText: false,
            controller: ctrl.dob,
          ),
          const SizedBox(
            height: 2,
          ),
          MyTextField(
            hintText: "Email",
            obscureText: false,
            controller: ctrl.email,
          ),
          const SizedBox(
            height: 2,
          ),
          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: ctrl.password,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () async {
                    ctrl.signupwituser(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Color.fromARGB(255, 255, 252, 252)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

//  print(
//                       "verifyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");

//                   print(
//                       "nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
//                   await FirebaseAuth.instance.verifyPhoneNumber(
//                       verificationCompleted: (PhoneAuthCredential credential) {
//                         print(
//                             "pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp");
//                       },
//                       verificationFailed: (FirebaseAuthException ex) {
//                         print(
//                             "verrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
//                       },
//                       codeSent: (String verificationid, int? resendtoken) {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => HomeP(
//                                 currentIndex: 0,
//                               ),
//                             ));
//                       },
//                       codeAutoRetrievalTimeout: (String verificationid) {},
//                       phoneNumber: ctrl.phone.text.toString());
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) {
//                       return HomeP(currentIndex: 0);
//                     },
//                   ));
//                   print("After ffffffffffffffffffffffffffffffffffffffunction");
