import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:myproject/viewmodel/controller_provider.dart';
import 'package:provider/provider.dart';


class OpenAuction extends StatefulWidget {
  const OpenAuction({super.key});

  @override
  State<OpenAuction> createState() => _OpenAuctionState();
}

class _OpenAuctionState extends State<OpenAuction> {
  bool isloading = true;
  late DateTime durationn;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> filteredlist = [];

  @override
  void initState() {
    bool isloading = true;
    SchedulerBinding.instance.addPostFrameCallback((Timestamp) async {
      await fetchdatacondition();

      setState(() {
        isloading = false;
      });
    });

    super.initState();
  }

  fetchdatacondition() async {
    print("vvvvvvvvvvvvvvvvvvvvvvvvvvvdeferferereerer");
    final CollectionReference items =
        FirebaseFirestore.instance.collection("Items");

    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection("Items")
          .where('Duration', isEqualTo: DateTime.now())
          .get();
      print(querySnapshot);
      setState(() {
        print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
        print(querySnapshot.docs);
        filteredlist = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    } catch (e) {
      print("error fetching data$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: filteredlist.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredlist[index]["title"]),
              );
            },
          ),
        )
      ],
    ));
  }

  //  bottomNavigationBar: MyBottomNavBar(
  //         currentIndex: 1,
  //         onTap: (p0) {
  //           Navigator.of(context).push(MaterialPageRoute(
  //               builder: (context) => HomeP(
  //                     currentIndex: p0,
  //                   )));
  //         },
  //       ),
}
