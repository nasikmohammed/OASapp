import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myproject/components/Item_tiles.dart';
import 'package:myproject/components/service_tile.dart';
import 'package:myproject/models/itemcart.dart';
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
        FirebaseFirestore.instance.collection("Service");

    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
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
                      final data = snapshot.requireData;

                      return ListView.builder(
                        itemCount: data.size,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var title = data.docs[index]['title'];
                          var summary = data.docs[index]['summary'];
                          var detaileddescription =
                              data.docs[index]['detaileddescription'];
                          var category = data.docs[index]['category'];
                          var baseamount = data.docs[index]['baseamount'];
                          var duration = data.docs[index]['Duration'];
                          var itemphoto = data.docs[index]['imagepath'];

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
                padding: EdgeInsets.only(top: 30),
                child: Divider(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
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

              SizedBox(
                height: 270, // Set a fixed height for the ListView
                child: StreamBuilder(
                  stream: service.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      final servicedata = snapshot.requireData;

                      return ListView.builder(
                        itemCount: servicedata.size,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var servicetitle =
                              servicedata.docs[index]['servicetitle'];
                          var servicesummery =
                              servicedata.docs[index]['servicesummery'];
                          var servicedescription =
                              servicedata.docs[index]['servicedescription'];
                          var servicecategory =
                              servicedata.docs[index]['servicecategory'];
                          var servicebaseamount =
                              servicedata.docs[index]['servicebaseamount'];
                          var serviceduration =
                              servicedata.docs[index]['serviceduration'];
                          var serviceimagepath =
                              servicedata.docs[index]['serviceimagepath'];

                          // Items items = value.getItemList()[index];

                          return ItemTiles(
                            itemimage: serviceimagepath,
                            title: servicetitle,
                            summery: servicesummery,
                            baseamount: servicebaseamount,
                            category: servicecategory,
                            duration: serviceduration,
                            detaileddescription: servicedescription,
                            // item: items,
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
