import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/model/user_model.dart';
import 'package:shop_app/screens/deatailscreen.dart';
import 'package:shop_app/screens/listproducts.dart';
import 'package:shop_app/screens/login.dart';
import 'package:shop_app/widget/singproduct.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import '../model/product.dart';

class HomePage extends StatefulWidget {
  String email;
  HomePage({required this.email});
  @override
  State<HomePage> createState() => _HomePageState();
}

UserModel? userModel;

var featureSnapShot;
var newachivesSnapShot;
var tie;
var dress;
var pant;
var shoes;
var shirt;

Product? menData;

Product? womenData;
Product? bulbData;

Product? monitorData;

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Widget _buildCategoreisProdect({String? image, required int color}) {
    return CircleAvatar(
      maxRadius: 35,
      backgroundColor: Color(color),
      child: Container(
        height: 45,
        child: Image(
          color: Colors.white,
          image: AssetImage("images/$image"),
        ),
      ),
    );
  }

  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "",
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: const CircleAvatar(
              maxRadius: 45,
              backgroundImage: AssetImage("images/ab.jpg"),
            ),
            decoration: BoxDecoration(color: Color(0xfff2f2f2)),
            accountEmail: Text(
              "${widget.email}",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            selected: homecolor,
            onTap: () {
              setState(() {
                homecolor = true;
                cartcolor = false;
                infocolor = false;
                contactcolor = false;
              });
            },
            leading: const Icon(Icons.home),
            title: const Text("Home"),
          ),
          ListTile(
            selected: cartcolor,
            onTap: () {
              setState(() {
                homecolor = false;
                cartcolor = true;
                infocolor = false;
                contactcolor = false;
              });
            },
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Cart"),
          ),
          ListTile(
            selected: infocolor,
            onTap: () {
              setState(() {
                homecolor = false;
                cartcolor = false;
                infocolor = true;
                contactcolor = false;
              });
            },
            leading: const Icon(Icons.info),
            title: const Text("About"),
          ),
          ListTile(
            selected: contactcolor,
            onTap: () {
              setState(() {
                homecolor = false;
                cartcolor = false;
                infocolor = false;
                contactcolor = true;
              });
            },
            leading: const Icon(Icons.phone),
            title: const Text("Contact Us"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Login(),
    
              
              ));
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
          )
        ],
      ),
    );
  }

  bool homecolor = false;

  bool cartcolor = false;

  bool infocolor = false;
  bool aboutcolor = false;

  bool contactcolor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        title: const Text(
          "HomePage",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              _key.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            )),
        backgroundColor: Colors.grey[100],
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("products")
              .doc("cWnxzZp6QMeCrMnvqm1o")
              .collection("featureproduct")
              .get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            featureSnapShot = snapshot;
            menData = Product(
                image: snapshot.data.docs[0]["image"],
                name: snapshot.data.docs[0]["name"],
                price: snapshot.data.docs[0]["price"]);
            womenData = Product(
                image: snapshot.data.docs[1]["image"],
                name: snapshot.data.docs[1]["name"],
                price: snapshot.data.docs[1]["price"]);
            return FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection("category")
                    .doc("QiWX7UYGH13GZCjYZoA4")
                    .collection("shirt")
                    .get(),
                builder: (context, shirtSnapshot) {
                  if (shirtSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  shirt = shirtSnapshot;
                  return FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection("category")
                          .doc("QiWX7UYGH13GZCjYZoA4")
                          .collection("dress")
                          .get(),
                      builder: (context, dressSnapshot) {
                        if (shirtSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        dress = dressSnapshot;
                        return FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection("category")
                                .doc("QiWX7UYGH13GZCjYZoA4")
                                .collection("pant")
                                .get(),
                            builder: (context, pantSnapshot) {
                              if (shirtSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              pant = pantSnapshot;
                              return FutureBuilder(
                                  future: FirebaseFirestore.instance
                                      .collection("category")
                                      .doc("QiWX7UYGH13GZCjYZoA4")
                                      .collection("tie")
                                      .get(),
                                  builder: (context, tieSnapshot) {
                                    if (shirtSnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    tie = tieSnapshot;
                                    return FutureBuilder(
                                        future: FirebaseFirestore.instance
                                            .collection("category")
                                            .doc("QiWX7UYGH13GZCjYZoA4")
                                            .collection("shoes")
                                            .get(),
                                        builder: (context, shoesSnapshot) {
                                          if (shirtSnapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                          shoes = shoesSnapshot;

                                          return FutureBuilder(
                                              future: FirebaseFirestore.instance
                                                  .collection("products")
                                                  .doc("cWnxzZp6QMeCrMnvqm1o")
                                                  .collection("newachives")
                                                  .get(),
                                              builder: (context,
                                                  AsyncSnapshot snapShot) {
                                                if (snapShot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                }
                                                newachivesSnapShot = snapShot;
                                                monitorData = Product(
                                                    image: snapShot.data.docs[0]
                                                        ["image"],
                                                    name: snapShot.data.docs[0]
                                                        ["name"],
                                                    price: snapShot.data.docs[0]
                                                        ["price"]);
                                                bulbData = Product(
                                                    image: snapShot.data.docs[1]
                                                        ["image"],
                                                    name: snapShot.data.docs[1]
                                                        ["name"],
                                                    price: snapShot.data.docs[1]
                                                        ["price"]);
                                                return Container(
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: ListView(
                                                    children: [
                                                      Container(
                                                        height: 240,
                                                        child: Carousel(
                                                          dotColor:
                                                              Colors.white,
                                                          autoplay: true,
                                                          showIndicator: false,
                                                          images: [
                                                            Image.network(
                                                                "https://img.freepik.com/free-photo/dark-haired-woman-with-red-lipstick-smiles-leans-stand-with-clothes-holds-package-pink-background_197531-17609.jpg?size=626&ext=jpg&ga=GA1.2.186015913.1640563200"),
                                                            Image.network(
                                                                "https://media.gq.com/photos/615b1d60f45f207112fc21b9/master/pass/watches.jpg"),
                                                            //  NetworkImage("https://img.freepik.com/free-photo/dark-haired-woman-with-red-lipstick-smiles-leans-stand-with-clothes-holds-package-pink-background_197531-17609.jpg?size=626&ext=jpg&ga=GA1.2.186015913.1640563200"),
                                                            //  NetworkImage("https://media.gq.com/photos/615b1d60f45f207112fc21b9/master/pass/watches.jpg"),
                                                            Image.network(
                                                                "https://image.shutterstock.com/image-photo/khaki-tshirt-isolated-on-white-260nw-1938977107.jpg"),
                                                            Image.network(
                                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbeKTwK47GF3aFv5S_qaGkeNflnx7LhXR1Kw&usqp=CAU"),
                                                            Image.network(
                                                                "https://image.shutterstock.com/image-vector/vector-fitness-sneakers-shoes-training-260nw-1272576460.jpg"),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 70,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              "Categories",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "See all",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 60,
                                                        child: Row(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pushReplacement(
                                                                        MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ListProduct(
                                                                    name:
                                                                        "Dress",
                                                                    snapShot:
                                                                        dress,
                                                                    email: widget
                                                                        .email,
                                                                  ),
                                                                ));
                                                              },
                                                              child: _buildCategoreisProdect(
                                                                  image:
                                                                      "1.png",
                                                                  color:
                                                                      0xff33dcfd),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pushReplacement(
                                                                        MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ListProduct(
                                                                    name:
                                                                        "Shirt",
                                                                    snapShot:
                                                                        shirt,
                                                                    email: widget
                                                                        .email,
                                                                  ),
                                                                ));
                                                              },
                                                              child: _buildCategoreisProdect(
                                                                  image:
                                                                      "2.png",
                                                                  color:
                                                                      0xfff38cdd),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pushReplacement(
                                                                        MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ListProduct(
                                                                    name:
                                                                        "Shoes",
                                                                    snapShot:
                                                                        shoes,
                                                                    email: widget
                                                                        .email,
                                                                  ),
                                                                ));
                                                              },
                                                              child: _buildCategoreisProdect(
                                                                  image:
                                                                      "3.png",
                                                                  color:
                                                                      0xff4ff2af),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pushReplacement(
                                                                        MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ListProduct(
                                                                    name: "Tie",
                                                                    snapShot:
                                                                        tie,
                                                                    email: widget
                                                                        .email,
                                                                  ),
                                                                ));
                                                              },
                                                              child: _buildCategoreisProdect(
                                                                  image:
                                                                      "4.png",
                                                                  color:
                                                                      0xff74acf7),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pushReplacement(
                                                                        MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ListProduct(
                                                                    name:
                                                                        "Pant",
                                                                    snapShot:
                                                                        pant,
                                                                    email: widget
                                                                        .email,
                                                                  ),
                                                                ));
                                                              },
                                                              child: _buildCategoreisProdect(
                                                                  image:
                                                                      "5.png",
                                                                  color:
                                                                      0xfffc6c8d),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 120,
                                                        width: double.infinity,
                                                        child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                height: 50,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        const Text(
                                                                          "Featured",
                                                                          style: TextStyle(
                                                                              fontSize: 17,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                              builder: (context) => ListProduct(
                                                                                name: "Featured",
                                                                                email: widget.email,
                                                                                snapShot: featureSnapShot,
                                                                              ),
                                                                            ));
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            "See all",
                                                                            style:
                                                                                TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ]),
                                                      ),
                                                      Row(children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pushReplacement(
                                                                            MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              DeatailScreen(
                                                                        image: menData!
                                                                            .image,
                                                                        price: menData!
                                                                            .price,
                                                                        name: menData!
                                                                            .name,
                                                                        email: widget
                                                                            .email,
                                                                      ),
                                                                    ));
                                                                  },
                                                                  child:
                                                                      SingleProduct(
                                                                    image: menData!
                                                                        .image,
                                                                    price: menData!
                                                                        .price,
                                                                    name: menData!
                                                                        .name,
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pushReplacement(
                                                                            MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              DeatailScreen(
                                                                        image: womenData!
                                                                            .image,
                                                                        price: womenData!
                                                                            .price,
                                                                        name: womenData!
                                                                            .name,
                                                                        email: widget
                                                                            .email,
                                                                      ),
                                                                    ));
                                                                  },
                                                                  child:
                                                                      SingleProduct(
                                                                    image: womenData!
                                                                        .image,
                                                                    price: womenData!
                                                                        .price,
                                                                    name: womenData!
                                                                        .name,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ]),
                                                      Column(children: [
                                                        Container(
                                                          height: 50,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  const Text(
                                                                    "New Archives",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pushReplacement(
                                                                              MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                ListProduct(
                                                                          name:
                                                                              "New Archives",
                                                                          email:
                                                                              widget.email,
                                                                          snapShot:
                                                                              newachivesSnapShot,
                                                                        ),
                                                                      ));
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      "View more",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ]),
                                                      Column(children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pushReplacement(
                                                                            MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              DeatailScreen(
                                                                        email: widget
                                                                            .email,
                                                                        image: monitorData!
                                                                            .image,
                                                                        price: monitorData!
                                                                            .price,
                                                                        name: monitorData!
                                                                            .name,
                                                                      ),
                                                                    ));
                                                                  },
                                                                  child:
                                                                      SingleProduct(
                                                                    image: monitorData!
                                                                        .image,
                                                                    price: monitorData!
                                                                        .price,
                                                                    name: monitorData!
                                                                        .name,
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pushReplacement(
                                                                            MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              DeatailScreen(
                                                                        email: widget
                                                                            .email,
                                                                        image: bulbData!
                                                                            .image,
                                                                        price: bulbData!
                                                                            .price,
                                                                        name: bulbData!
                                                                            .name,
                                                                      ),
                                                                    ));
                                                                  },
                                                                  child:
                                                                      SingleProduct(
                                                                    image: bulbData!
                                                                        .image,
                                                                    price: bulbData!
                                                                        .price,
                                                                    name: bulbData!
                                                                        .name,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ]),
                                                    ],
                                                  ),
                                                );
                                              });
                                        });
                                  });
                            });
                      });
                });
          }),
    );
  }
}
