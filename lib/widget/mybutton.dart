import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
 
 final void Function()? onPressed;
 final String name;

 MyButton({required this.name,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
       height: 45,
       
       width: double.infinity,
        color: Colors.blue,
        child:ElevatedButton(
          onPressed: onPressed,
         
          child:  Text(
           name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
