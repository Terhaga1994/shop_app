import 'package:flutter/material.dart';
class SingleProduct extends StatelessWidget {
 final String? image;
 final double? price;
 final String? name;
 SingleProduct({this.image,this.price, this.name});
  @override
  Widget build(BuildContext context) {
    return  Card(
            child: Container(
                      height: 250,
                      width: 165,
                     
                      child: Column(
                        children: [
                          Container(
                          height: 190,
                          width: 160,
                         
                          decoration:  BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("$image"))
                          ),
                          ),
                          Text("\$ $price",style: const TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                          ),
                           Text(name!,style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );


  }
}