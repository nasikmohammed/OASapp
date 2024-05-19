import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproject/components/my_textfield.dart';
import 'package:myproject/models/userdetails.dart';
import 'package:myproject/view/OGhome.dart';
import 'package:myproject/view/home.dart';
import 'package:myproject/view/login.dart';
import 'package:myproject/view/otp.dart';
import 'package:myproject/viewmodel/controller_provider.dart';
import 'package:myproject/viewmodel/userstore.dart';
import 'package:provider/provider.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

Userstore _userstore = Userstore();

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<ControllerProvider>(context);
    return Scaffold(
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
            hintText: "Password",
            obscureText: true,
            controller: ctrl.password,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  print(
                      "verifyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");

                  print(
                      "nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
                  await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted: (PhoneAuthCredential credential) {
                        print(
                            "pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp");
                      },
                      verificationFailed: (FirebaseAuthException ex) {
                        print(
                            "verrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
                      },
                      codeSent: (String verificationid, int? resendtoken) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenOtp(
                                verificationid: verificationid,
                              ),
                            ));
                      },
                      codeAutoRetrievalTimeout: (String verificationid) {},
                      phoneNumber: ctrl.phone.text.toString());
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ScreenOtp(
                        verificationid: ctrl.otp.text,
                      );
                    },
                  ));
                  print("After ffffffffffffffffffffffffffffffffffffffunction");

                  // _userstore
                  //     .adduserdetails(UserModel(
                  //         fullname: ctrl.fullname.text,
                  //         address: ctrl.address.text,
                  //         occupation: ctrl.occupation.text,
                  //         phone: ctrl.phone.text,
                  //         dob: ctrl.dob.text,
                  //         password: ctrl.password.text))
                  //     .then(
                  //   (value) {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) => HomeP(
                  //         currentIndex: 0,
                  //       ),
                  //     ));
                  //   },
                  // );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 166, 15, 15)),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(color: Color.fromARGB(255, 255, 252, 252)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
