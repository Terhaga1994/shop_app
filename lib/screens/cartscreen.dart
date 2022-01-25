import 'package:flutter/material.dart';
import 'package:shop_app/model/user_model.dart';
import 'package:shop_app/screens/checkout.dart';
import 'package:shop_app/screens/deatailscreen.dart';
import 'package:shop_app/screens/homePage.dart';
import 'package:shop_app/widget/cartsingleproduct.dart';

class CartScreen extends StatefulWidget {
  
 
 final String image;
 final String name;
 final double price;
 final int quentity1;


 CartScreen({required this.image,required this.name,required this.price,required this.quentity1});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
String email="";
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  Container(height: 60,
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.only(bottom: 10),
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => CheckOut(
                                name: widget.name,
                                image:widget.image ,
                                price: widget.price,
                                quentity1: widget.quentity1,
                              )
                            ));
                       
                    },
                    color:const Color(0xff746bc9),
                    
                    child: const Text("Countinous",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                  ),
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
             Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => DeatailScreen(
                                name: widget.name,
                                image:widget.image ,
                                price: widget.price,
                                email:email ,
                            
                              )
                            ));
          
          },
        ),
       
        title: Text("Cart Page",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body:ListView(children: [
        CartSingleProduct(image: widget.image,name: widget.name,price: widget.price,quentity1: widget.quentity1,),
        

      ],)
    );
  }
}
