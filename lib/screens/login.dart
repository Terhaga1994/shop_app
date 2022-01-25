import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/screens/homePage.dart';
import 'package:shop_app/screens/signup.dart';
import 'package:shop_app/widget/changscreen.dart';
import 'package:shop_app/widget/mybutton.dart';
import 'package:shop_app/widget/mytextformfield.dart';
import 'package:shop_app/widget/passwordformfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool obseText = true;

String? password;

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _LoginState extends State<Login> {
  void validation(String email,String password) async {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      var result = FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.toString(), password: password.toString())
          .then((value) => {
    Fluttertoast.showToast(msg: "login is Successful"),
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(email:email,)))
      });
    } else {
      print("No");
    }
  }

  Widget _buildAllParts() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height*.5,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Login",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          MyTextFormFeild(
            name: "Email",
            controler: emailController,
             onSaved: (value) {
          emailController.text = value!;
        },
            
            onChanged: (value) {
              setState(() {
                email = value!;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return ("Please Enter your Email");
              }
              // req Expression for validation
              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.([a-zA-Z]{2,5})")
                  .hasMatch(value)) {
                return ("Please Enter your valid Email");
              }
              return null;
            },
            icon: const Icon(
              Icons.email,
            ),
          ),
          PassswordTextFormField(
            obseText: obseText,
            controler: passwordController,
              onSaved: (value) {
          passwordController.text = value!;
        },
            name: "Password",
            onChanged: (value) {
              setState(() {
                password = value!;
              });
            },
            
            validator: (value) {
              RegExp regex = RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return ("Please Enter your password");
              }
              if (!regex.hasMatch(value)) {
                return ("Please Enter your password (Min 6 Chracters");
              }
            },
            onTap: () {
              setState(() {
                obseText = !obseText;
              });
              FocusScope.of(context).unfocus();
            },
          ),
          MyButton(
            name: "Login",
            onPressed: () {
              // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //   builder: (context) =>  HomePage()));
              validation(emailController.text,passwordController.text);
            },
          ),
          ChangeScreen(
            whichAccount: "I don't have  an acount?",
            name: "SignUp",
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const SignUp()));
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAllParts(),
            ],
          ),
        ),
      ),
    );
  }
}
