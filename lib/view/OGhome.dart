import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myproject/components/Item_tiles.dart';
import 'package:myproject/components/service_tile.dart';
import 'package:myproject/models/itemcart.dart';
import 'package:myproject/models/items.dart';
import 'package:provider/provider.dart';

class Realhome extends StatefulWidget {
  const Realhome({Key? key}) : super(key: key);

  @override
  State<Realhome> createState() => _RealhomeState();
}

class _RealhomeState extends State<Realhome> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference items =
        FirebaseFirestore.instance.collection("Items");
    final CollectionReference service =
        FirebaseFirestore.instance.collection("Services");

    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular picks",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "see all",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),

              //list of items for bid

              SizedBox(
                height: 290, // Set a fixed height for the ListView
                child: StreamBuilder(
                  stream: items.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var title = snapshot.data!.docs[index]['title'];
                          var summary = snapshot.data!.docs[index]['summary'];
                          var detaileddescription =
                              snapshot.data!.docs[index]['detaileddescription'];
                          var category = snapshot.data!.docs[index]['category'];
                          var baseamount =
                              snapshot.data!.docs[index]['baseamount'];
                          var duration = snapshot.data!.docs[index]['Duration'];
                          var itemphoto =
                              snapshot.data!.docs[index]['imagepath'];

                          // Items items = value.getItemList()[index];

                          return ItemTiles(
                            itemimage: itemphoto,
                            title: title,
                            summery: summary,
                            baseamount: baseamount,
                            category: category,
                            duration: duration,
                            detaileddescription: detaileddescription,
                            // item: items,
                          );
                        },
                      );
                    }
                  },
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: Divider(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular services",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "see all",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),

              StreamBuilder(
                stream: service.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  return SizedBox(
                    height: 290,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var servicetitle =
                            snapshot.data!.docs[index]['servicetitle'];
                        var servicesummery =
                            snapshot.data!.docs[index]['servicesummery'];
                        var servicedescription =
                            snapshot.data!.docs[index]['servicedescription'];
                        var servicecategory =
                            snapshot.data!.docs[index]['servicecategory'];
                        var servicebaseamount =
                            snapshot.data!.docs[index]['servicebaseamount'];
                        var serviceduration =
                            snapshot.data!.docs[index]['serviceduration'];
                        var serviceimagepath = snapshot.data!.docs[index][''];

                        return ServiceTile(
                          imagepath: serviceimagepath,
                          title: servicetitle,
                          summery: servicesummery,
                          description: servicedescription,
                          category: servicecategory,
                          baseamount: servicebaseamount,
                          duration: serviceduration,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
