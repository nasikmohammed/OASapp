import 'package:flutter/material.dart';
class MyTextField extends StatelessWidget {
 
  final String hintText;
  final bool obscureText;
   final TextEditingController? controller;

  const MyTextField({
    super.key,
         this.controller,

    required this.hintText,
    required this.obscureText,


  });

  @override
  Widget build(BuildContext context) {
    return   Padding(
             padding:  EdgeInsets.symmetric(horizontal: 40,vertical: 22),
             child: TextField(
              controller: controller,
              
              obscureText: obscureText,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
             
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 190, 190, 190))),

                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
                hintText: hintText,
                
              ),
             
             ),
           );
  }
}