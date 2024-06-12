// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myproject/components/my_textfield.dart';
import 'package:myproject/view/register.dart';
import 'package:myproject/viewmodel/controller_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  //text edting contrllers
  void signuserin() {}

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<ControllerProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 252, 225),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 100,
              ),
              Text(
                "Hello, You've been Missed",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: ctrl.loginemail,
              ),
              SizedBox(
                height: 1,
              ),
              MyTextField(
                hintText: "password",
                obscureText: true,
                controller: ctrl.loginpassword,
              ),
              ElevatedButton(
                onPressed: () {
                  print("objegffggct");
                  ctrl.Loginwithuser(context);
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red)),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 252, 252)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 33,
                  ),
                  Text('Not a member?'),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return register();
                        },
                      ));
                    },
                    child: Text("Click Here"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
