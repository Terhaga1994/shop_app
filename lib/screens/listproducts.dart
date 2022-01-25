

import 'package:flutter/material.dart';
import 'package:shop_app/screens/homePage.dart';
import 'package:shop_app/screens/login.dart';
import 'package:shop_app/widget/singproduct.dart';

class ListProduct extends StatelessWidget {
  final String name;
  final snapShot;
  final String email;
  ListProduct({required this.name, this.snapShot,required this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomePage(email:email),
                ));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: Colors.grey[100],
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 800,
                  child: GridView.builder(
                    itemCount: snapShot.data.docs.length,
                    itemBuilder: (context, index) => SingleProduct(
                        image: snapShot.data.docs[index]["image"],
                        name: snapShot.data.docs[index]["name"],
                        price: snapShot.data.docs[index]["price"]),
                    scrollDirection: Axis.vertical,
                    gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                  ),
                )
              ],
            )));
  }
}
