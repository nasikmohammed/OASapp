// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myproject/components/my_textfield.dart';
import 'package:myproject/view/home.dart';

class Login extends StatefulWidget {
   const Login({super.key});
  //text edting contrllers
  void signuserin(){}
  



  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 255, 252, 225),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
          
            Icon(Icons.lock,size: 100,),
            Text("Hello, You've been Missed",
            style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
            
            ),
            
          MyTextField(
            
            
            hintText: "usernme",
            obscureText: false,
          ),
          SizedBox(height: 1,),
          MyTextField(
            
            hintText: "password",
            obscureText: true,
          ),
          
         ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeP(currentIndex: 0,),
                  ));
                },
                style: ButtonStyle(
                  
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromARGB(255, 166, 15, 15)),
                ),
                child: Text("Register",style: TextStyle(color: const Color.fromARGB(255, 255, 252, 252)),),
              ),
      Row( mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(height: 33,),
    Text('Not a member?'),
    SizedBox(width: 5,),
    Text('click here',style: TextStyle(color: Colors.blue),),
    
        ],

      ),
          ],),
        ),
        
      ),
    
    );
  }
}