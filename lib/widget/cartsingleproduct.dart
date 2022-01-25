import 'package:flutter/material.dart';
import 'package:shop_app/screens/cartscreen.dart';

class CartSingleProduct extends StatefulWidget {
  String name;
  String image;
  int quentity1;
  double price;
  CartSingleProduct(
      {required this.name,
      required this.image,
      required this.price,
      required this.quentity1});

  @override
  State<CartSingleProduct> createState() => _CartSingleProductState();
}

class _CartSingleProductState extends State<CartSingleProduct> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget.image))),
                ),
                Container(
                    height: 140,
                    width: 200,
                    child: ListTile(
                        title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.name),
                        Text("Clothes"),
                        Text(
                          "\$ ${widget.price.toString()}",
                          style: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (widget.quentity1 > 1) {
                                      widget.quentity1--;
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                widget.quentity1.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.quentity1++;
                                    });
                                  },
                                  child: const Icon(Icons.add,
                                      color: Colors.black))
                            ],
                          ),
                        ),
                      ],
                    )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
