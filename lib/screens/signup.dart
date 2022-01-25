import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/model/user_model.dart';
import 'package:shop_app/screens/homePage.dart';
import 'package:shop_app/screens/login.dart';
import 'package:shop_app/widget/changscreen.dart';
import 'package:shop_app/widget/mytextformfield.dart';
import 'package:shop_app/widget/passwordformfield.dart';
import '../widget/mybutton.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffKey = GlobalKey<ScaffoldState>();
bool obseText = true;
  late String email;
   late  String password;
class _SignUpState extends State<SignUp> {
   final TextEditingController nameEditingController = TextEditingController();
  
final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();
 final TextEditingController phoneEditingController = TextEditingController();
 
  void validation() async{
    final FormState? _form = _formKey.currentState;
   final _auth =FirebaseAuth.instance;
    if (_form!.validate()) {
  try{
 var result= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  FirebaseFirestore firebaseFirestore =FirebaseFirestore.instance;
User? user=_auth.currentUser;

UserModel userModel=UserModel();

//writting all values
userModel.name=nameEditingController.text;
userModel.email= user!.email;
userModel.uid= user.uid;
userModel.phoneNumber= int.parse(phoneEditingController.text);



await firebaseFirestore
.collection("users")
.doc(user.uid)
.set(userModel.toMap());
Fluttertoast.showToast(msg: "Acount Created Successfully");
Navigator.pushAndRemoveUntil(
  (context), 
MaterialPageRoute(builder: (context) =>   HomePage(email: userModel.email.toString())), 
(route) => false);





  } on PlatformException catch(e){
    _scaffKey.currentState!.showSnackBar(
      SnackBar(content: Text(e.message!),)
    );
  }
   } else {
      print("No");
    }
  }

  Widget _buildAllTextFormField(){
    
    return Container(
      height:  MediaQuery.of(context).size.height*.4,
      child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
                MyTextFormFeild(
                              name: "UserName",
                                 onSaved: (value) {
          nameEditingController.text = value!;
        },
                              controler: nameEditingController,
                              validator: (value) {
                                RegExp regex = RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ("Please Enter your  name");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Please Enter your name (Min 6 Chracters");
                                }
                                return null;
                              },
                              icon: const Icon(Icons.account_box_outlined),
                            ),
                            MyTextFormFeild(
                              name: "Email",
                                 onSaved: (value) {
          emailEditingController.text = value!;
        },
                              controler: emailEditingController,
                              onChanged: (value){
                                setState(() {
                                  
                                email=value!;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Please Enter your Email");
                                }
                                // req Expression for validation
                                if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.([a-zA-Z]{2,5})")
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
          passwordEditingController.text = value!;
        },
                              name: "Password",
                               onChanged: (value){
                                setState(() {
                                  
                                password=value!;
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
                            MyTextFormFeild(
                              name: "PhoneNumber",
                                 onSaved: (value) {
         phoneEditingController.text = value!;
        },
                              controler: phoneEditingController,
                              validator: (value) {
                                RegExp regex = RegExp(r'^.[0-9]{9,}$');
                                if (value!.isEmpty) {
                                  return ("Please Enter your PhoneNumber");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Please Enter your  valid phoneNumber ");
                                }
                              },
                              icon: const Icon(
                                Icons.phone,
                              ),
                            ),
                           
        ],
      ),
    );
  }

  Widget _buildBottomPart(){
    return Container(
              child: Column(
                children: [
                  Container(
                      height:200,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Registration",
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 400,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      _buildAllTextFormField(),
                      MyButton(
                            name: "SignUp",
                            onPressed: () {
                              validation();
                            },
                          ),
                          ChangeScreen(
                            whichAccount: "I have already an acount?",
                            name: "Login",
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffKey,
      body: SafeArea(
        child: SingleChildScrollView(
          // ignore: avoid_unnecessary_containers
          child: Form(
            key: _formKey,
            child: _buildBottomPart()
            //
          ),
        ),
      ),
    );
  }
}
