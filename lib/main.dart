

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/provider/categoryprovidor.dart';
import 'package:shop_app/provider/productprovidor.dart';
import 'package:shop_app/screens/cartscreen.dart';
import 'package:shop_app/screens/checkout.dart';
import 'package:shop_app/screens/deatailscreen.dart';
import 'package:shop_app/screens/homePage.dart';
import 'package:shop_app/screens/listproducts.dart';
import 'package:shop_app/screens/signup.dart';
import 'package:shop_app/screens/welcomescreen.dart';
import 'package:provider/provider.dart';


  Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,  
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  WelcomeScreen());

  }
}
