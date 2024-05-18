 import 'package:flutter/material.dart';
import 'package:myproject/models/items.dart';

class Cart extends ChangeNotifier {
//list of itwms fr sale

  List<Items> itemShop = [
    Items(
        title: 'Jackfruit',
        summary: '4 ripe jackfruits for sale',
        expiry: '12/22/2022',
        baseamount: '300 rs',
       // imagepath: 'assets/jack.jpg',
        detaileddescription: 'good',
        category: 'food'),
    Items(
        title: 'CB 350',
        summary: 'less used bike',
        expiry: '11/11/2011',
        baseamount: '123332 rs',
       // imagepath: 'assets/cbbike.jpg',
        detaileddescription: 'fdsfsaf',
        category: 'weapons'),
    Items(
        title: 'Gramaphone',
        summary: 'vintage Item',
        expiry: '11/3/2024',
        baseamount: '3313 rs',
        imagepath: 'assets/grama.jpg',
        detaileddescription: 'dsafdfafdasfdsf',
        category: 'food'),
  ];

  List<Servicemodel> serviceShop = [
    Servicemodel(
        title: 'Painting',
        description: 'need to paint house',
        duration: '11/2/2011',
        baseamount: '3399 rs',
        imagepath: 'assets/house.jpg',
        category: 'manual labor',
       
        summery: "summery"),
    Servicemodel(
        title: 'make a software',
        description: 'need to a commericial software',
        duration: '11/4/4444',
        baseamount: '2330 rs',
        imagepath: 'assets/andro.jpg',
        category: 'naise work',
        summery: 'missile go vroom'),
    Servicemodel(
        title: 'River clean',
        description: 'need to clean a river',
        duration: '33/03/3333',
        baseamount: '90 rs',
        imagepath: 'assets/gard.jpg',
        category: 'aadf',
        summery:
            'naise river only crocs and piranhas and anacondas hehe')
  ];


 List<Items> myAuctionedThings = [];

//get list of items for sale
  List<Items> getItemList() {
    return itemShop;
  }

  List<Servicemodel> getServiceList() {
    return serviceShop;
  }

//get myauction
  List<Items> getUserCart() {
    return myAuctionedThings;
  }

void addItemToCart(Items items){
  myAuctionedThings.add(items);
}
}
