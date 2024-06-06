import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myproject/view/profile.dart';
import 'package:myproject/view/recnotif.dart';
import 'package:myproject/view/userfeedback.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 252, 225),
      body: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Center(
              child: CircleAvatar(
            radius: 50,
            child: Icon(
              Icons.portrait_rounded,
              size: 40,
            ),
          )),
          SizedBox(
            height: 33,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScreenUserProfile(),
              ));
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                height: 50,
                width: 330,
                child: Center(
                    child: Text(
                  'My profile',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ReciNotif(),
              ));
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                height: 50,
                width: 330,
                child: Center(
                    child: Text(
                  'Notifications',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Userfeedback(),
              ));
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                height: 50,
                width: 330,
                child: Center(
                    child: Text(
                  'Feedback',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              height: 50,
              width: 330,
              child: Center(
                  child: Text(
                'About Us',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))),
        ],
      ),
    );
  }
}
