import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Userfeedback extends StatefulWidget {
  const Userfeedback({super.key});

  @override
  State<Userfeedback> createState() => _UserfeedbackState();
}

class _UserfeedbackState extends State<Userfeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromARGB(255, 255, 248, 227),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          height: 580,
          width: 440,
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  const Text(
                    'Rate Us',
                    style: TextStyle(
                        color: Color.fromARGB(186, 19, 7, 7),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(height: 12,),
                    RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.favorite,
                      color: Color.fromARGB(255, 205, 2, 2),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const SizedBox(height: 12,),
                  Container(width: 370,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'name',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
              
                    Container(width: 370,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'e-mail',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
              
                   Container(width: 370,
                   height: 220,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Add your comments.....',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.comment, color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 17,),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ButtonStyle(
                      
                      backgroundColor:
                          MaterialStateProperty.all(Color.fromARGB(255, 166, 15, 15)),
                    ),
                    child: const Text("Submit",style: TextStyle(color: Color.fromARGB(255, 255, 252, 252)),),
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
