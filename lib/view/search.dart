// import 'package:flutter/material.dart';

// class search extends StatefulWidget {
//   const search({super.key});

//   @override
//   State<search> createState() => _searchState();
// }

// class _searchState extends State<search> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [

//         Container(
//           padding: EdgeInsets.all(12),
//           margin: EdgeInsets.symmetric(horizontal: 25),
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 177, 177, 177),
//             borderRadius: BorderRadius.circular(4),
//           ),

//         ),

//       ],),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List _allresult = [];
  List _resultlist = [];

  TextEditingController _serchcontroller = TextEditingController();
  getclientstream() async {
    var data = await FirebaseFirestore.instance
        .collection("Items")
        .orderBy("title")
        .get();
    setState(() {
      _allresult = data.docs;
    });
  }

  serchresultlist() {
    var showresult = [];
    if (_serchcontroller.text != "") {
      for (var clintsnapshot in _allresult);
    } else {
      showresult = List.from(_allresult);
    }
  }

  @override
  void initState() {
    _serchcontroller.addListener(_onserchchanged);
    super.initState();
  }

  _onserchchanged() {
    print(_serchcontroller.text);
  }

  @override
  void dispose() {
    _serchcontroller.removeListener(_onserchchanged);
    _serchcontroller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getclientstream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _serchcontroller,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _allresult.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_allresult[index]['title']),
              );
            },
          ),
        )
      ],
    );
  }
}
