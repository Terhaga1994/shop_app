// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shop_app/screens/cartscreen.dart';
import 'package:shop_app/screens/homePage.dart';
import 'package:shop_app/screens/login.dart';
import 'package:shop_app/screens/signup.dart';

class DeatailScreen extends StatefulWidget {
final String? image;
final String? name;
final double? price;
final String email;
DeatailScreen({ this.image, this.price, this.name,required this.email});

  @override
  State<DeatailScreen> createState() => _DeatailScreenState();
}

class _DeatailScreenState extends State<DeatailScreen> {
  int count=1;
  Widget _buildSizeProduct(String name) {
    return Container(
      height: 60,
      width: 60,
      color: const Color(0xfff2f2f2),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  Widget _buildColorProduct(Color color) {
    return Container(
      height: 60,
      width: 60,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deatal Page",style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(  icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          
        ),onPressed: (){
           Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => HomePage(email: widget.email,)
                            ));
        },),
     
      ),
      body: Container(
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 350,
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 220,
                      decoration:  BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(widget.image.toString()))),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    child: Row(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            widget.name.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Text(widget.price.toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              )),
                         const Text("Description",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ))
                        ],
                      )
                    ]),
                  ),
                  Container(
                    height: 160,
                    child: Wrap(
                      children: const [
                        Text(
                          "This layer is the lowest layer in the cloud architecture. All the users or client belong to this layer. This is the place where the client/user initiates the connection to the cloud. The client can be any device such as a thin client, thick client, or mobile or any device that would support basic functionalities to access a web application",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  const Text("Size",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 270,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSizeProduct("S"),
                        _buildSizeProduct("M"),
                        _buildSizeProduct("L"),
                        _buildSizeProduct("XXL"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("Color",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 265,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildColorProduct(Colors.blue),
                        _buildColorProduct(Colors.yellow),
                        _buildColorProduct(Colors.green),
                        _buildColorProduct(Colors.red),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Quentity",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    width: 130,
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
                             if(count>1){
                                count--;
                             }
                            });
                          }
                          ,
                          child: const Icon(Icons.remove,color: Colors.black,),
                        ),
                         Text(count.toString(),
                        style: const TextStyle(color:Colors.black),),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                              count++;
                            });
                            }, 
                            child: const Icon(Icons.add,color: Colors.black))
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(height: 60,
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: (){
                        Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => CartScreen(

                                name: widget.name.toString(),
                                image:widget.image.toString() ,
                                price: widget.price!.toDouble(),
                                quentity1: count,
                              )
                            ));
                    },
                    color: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      
                    ),
                    child: const Text("Check Out",style: TextStyle(fontSize: 18),),
                  ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
