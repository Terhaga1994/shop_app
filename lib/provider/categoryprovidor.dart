import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/model/product.dart';
import 'package:shop_app/screens/checkout.dart';

class CategoryProvidor with ChangeNotifier {
  List<Product> shirt = [];
   late Product  shirtData;
  Future<void> getShirtData() async {
    
    List<Product> newList = [];
    var shirtSnapshot = await FirebaseFirestore.instance
        .collection("category")
        .doc("QiWX7UYGH13GZCjYZoA4")
        .collection("shirt")
        .get();
    shirtSnapshot.docs.forEach((element) {
      Product(
          image: element.data()["image"],
          name: element.data()["name"],
          price: element.data()["price"]);
           newList.add(shirtData);
    },
      
    );
shirt =newList;
  }
  List<Product> get getShirtList{
    return shirt;
  }
}
