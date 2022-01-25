import 'package:flutter/material.dart';
import 'package:shop_app/screens/login.dart';
import 'package:shop_app/screens/signup.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
        color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
            Container(
              height: MediaQuery.of(context).size.height*.8,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://previews.123rf.com/images/ploiipjj/ploiipjj1711/ploiipjj171100033/89454843-young-couple-at-shoping-with-trolley-cart-papers-bags-and-boxes-flat-background-vector-cartoon-illus.jpg")
                        // image: AssetImage("images/shop.jpg")
                        )),
              ),
             const Text(
                "Welocame",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:const [
                      Text(
                  "Ready To Start Shopping Sign Up ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    
                  ),
                ),
                 Text(
                  "To get Started ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    
                  ),
                ),
                  ],
                ),
              ),
               Container(
       height: 40,
       
       width: 250,
        color: Colors.blue,
        child:ElevatedButton(
          onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const SignUp()));
          },
          child:  const Text(
           "Sign Up",
            textAlign: TextAlign.center,
            style:  TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )),
        Container(
          height: 45,
          child: Column(
            children: [
              Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
         "Already have an account?",
          style:  TextStyle(color: Colors.black, fontSize: 18),
        ),

        GestureDetector(
          onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Login()));
          },
          child: const Text(
            "Login",
            style:  TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        )
      ],
    )
            ],
          ),
        )
                ],
              ),
            )

            ],
          ),
        ),
      ),
    );
  }
}
