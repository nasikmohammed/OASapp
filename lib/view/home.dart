import 'package:flutter/material.dart';

import 'package:myproject/view/OGhome.dart';
import 'package:myproject/view/additem.dart';
import 'package:myproject/view/login.dart';
import 'package:myproject/view/myauction.dart';
import 'package:myproject/view/search.dart';
import 'package:myproject/view/settings.dart';

// ignore: must_be_immutable
class HomeP extends StatefulWidget {
  int currentIndex = 0;
  HomeP({super.key, required this.currentIndex});

  @override
  State<HomeP> createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  List<Widget> pages = [
    Realhome(),
    MyAuction(),
    AddItem(),
    Search(),
    settings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 248, 227),

//

/////

        body: Center(
          child: pages[widget.currentIndex],
        ),
        drawer:  Drawer(
          width: 200,
          backgroundColor: Color.fromARGB(255, 56, 83, 88),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 22, top: 33),
                    child: ListTile(
                      leading: Icon(
                        Icons.all_out_rounded,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      title: Text(
                        'Items',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: ListTile(
                      leading: Icon(
                        Icons.all_out_rounded,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      title: Text(
                        'Services',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 22),
                child: ListTile(
                  leading: Icon(
                    Icons.exit_to_app_rounded,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  title: TextButton(
                    onPressed:  () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Login(),
                  ));
                },
                    child: Row(
                      children: [
                        Text(
                          'Exit',
                          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 34,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
        bottomNavigationBar: MyBottomNavBar(
          currentIndex: widget.currentIndex,
          onTap: (p0) {
            setState(() {
              widget.currentIndex = p0;
            });
          },
        ));
  }
}

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  int currentIndex;
  void Function(int)? onTap;
  MyBottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
      fixedColor: const Color.fromARGB(255, 214, 14, 14),
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 249, 247, 246),
          label: "home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "MyAuction",
          icon: Icon(Icons.store_mall_directory_rounded),
        ),
        BottomNavigationBarItem(
          label: "add",
          icon: Icon(
            Icons.control_point_duplicate_sharp,
            size: 33,
            color: Color.fromARGB(255, 99, 0, 129),
            weight: 12,
          ),
        ),
        BottomNavigationBarItem(
          label: "search",
          icon: Icon(Icons.search_sharp),
        ),
        BottomNavigationBarItem(
          label: "settings",
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
