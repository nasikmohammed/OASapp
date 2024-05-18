import 'package:flutter/material.dart';
import 'package:myproject/components/my_textfield.dart';
import 'package:myproject/view/login.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 255, 252, 225),
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
          const MyTextField(hintText: "full name", obscureText: false),
          const SizedBox(
            height: 2,
          ),
          const MyTextField(hintText: "address", obscureText: false),
          const SizedBox(
            height: 2,
          ),
          const MyTextField(hintText: "Occupation", obscureText: false),
          const SizedBox(
            height: 2,
          ),
          const MyTextField(hintText: "Phone", obscureText: false),
          const SizedBox(
            height: 2,
          ),
          const MyTextField(hintText: "Date of Birth", obscureText: false),
          const SizedBox(
            height: 2,
          ),
          const MyTextField(hintText: "Password", obscureText: true),
         


          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Login(),
                  ));
                },
                child: const Text("Register",style: TextStyle(color: Color.fromARGB(255, 255, 252, 252)),),
                style: ButtonStyle(
                  
                  backgroundColor:
                      MaterialStateProperty.all(const Color.fromARGB(255, 166, 15, 15)),
                ),
              ),
            ],
          ),


          

        ],
      ),
    );
  }
}
