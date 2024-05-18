import 'package:flutter/material.dart';
import 'package:myproject/view/home.dart';

class ReciNotif extends StatefulWidget {
  const ReciNotif({super.key});

  @override
  State<ReciNotif> createState() => _ReciNotifState();
}

class _ReciNotifState extends State<ReciNotif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color.fromARGB(255, 255, 248, 227),
        body: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            Expanded(
                child: Container(
                  width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text('no new notifications',style: TextStyle(color: Colors.black45,fontSize: 18),)),
            )),
          ],
        ),
        bottomNavigationBar: MyBottomNavBar(
          currentIndex: 4,
          onTap: (p0) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeP(
                      currentIndex: p0,
                    )));
          },
        ));
  }
}
