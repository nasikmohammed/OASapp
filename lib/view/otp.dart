import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproject/components/my_textfield.dart';
import 'package:myproject/view/home.dart';
import 'package:myproject/viewmodel/controller_provider.dart';
import 'package:provider/provider.dart';

class ScreenOtp extends StatefulWidget {
  String verificationid;
  ScreenOtp({super.key, required this.verificationid});

  @override
  State<ScreenOtp> createState() => _ScreenOtpState();
}

class _ScreenOtpState extends State<ScreenOtp> {
  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<ControllerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ScreenOtp"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              hintText: "Enter Your Otp",
              obscureText: false,
              controller: ctrl.otp),
          ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.verificationid,
                          smsCode: ctrl.otp.text.toString());
                  FirebaseAuth.instance.signInWithCredential(credential).then(
                    (value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeP(currentIndex: 0),
                          ));
                    },
                  );
                } catch (exeption) {
                  log(exeption.toString());
                }
              },
              child: Text("OTP"))
        ],
      ),
    );
  }
}
