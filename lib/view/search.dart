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
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
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
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
