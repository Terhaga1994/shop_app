import 'package:flutter/material.dart';
import 'package:shop_app/screens/cartscreen.dart';

class CheckOut extends StatefulWidget {
  final String image;
 final String name;
 final double price;
 final int quentity1;
 CheckOut({required this.image,required this.name,required this.price,required this.quentity1});
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
 
 
  Widget _buildSingleCartProduct() {
   
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
                          width: 125,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Text("Quentities"), Text("${widget.quentity1}")],
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

  Widget _buildBotoDeatails(
      {required String startName, required String endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          startName,
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          "$endName",
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  int count = 1;
  @override
  Widget build(BuildContext context) {
      double? subTotal=widget.quentity1.toDouble()*widget.price;
  int discount=3;
  double shipping=60;
  double rippedDiscount=discount/100*subTotal;
  double total=subTotal+shipping-rippedDiscount;
    return Scaffold(
         bottomNavigationBar:  Container(height: 60,
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.only(bottom: 10),
                  child: RaisedButton(
                    onPressed: (){
                       
                    },
                    color:const Color(0xff746bc9),
                    
                    child: const Text("Buy",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                  ),
      appBar: AppBar(
        title: Text("CheckOut Page",style: TextStyle(color: Colors.black),),
        centerTitle: true,
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
                              builder: (context) => CartScreen(
                                name: widget.name,
                                image:widget.image ,
                                price: widget.price,
                                quentity1: widget.quentity1,
                              )
                            ));
          },
        ),
       
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
       child: ListView(
         children: [
             Column(
          children: [
          
            SizedBox(
              height: 10,
            ),
            _buildSingleCartProduct(),
         
            
           Container(
             height: 150,
             child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBotoDeatails(
                    startName: "Yours Price", endName: "\$ $subTotal"),
                _buildBotoDeatails(
                  startName: "Discount",
                  endName: "$discount \%"
                ),
                _buildBotoDeatails(
                  startName: "Shiping",
                  endName: "\$ $shipping"
                ),
                _buildBotoDeatails(
                  startName: "Total",
                  endName: "\$ $total"
                ),
              ],
            ),
           )
          ],
        ),
         ],
       ),
      ),
    );
  }
}
