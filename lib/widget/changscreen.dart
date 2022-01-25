import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
 
 final void Function()? onTap;
 final String name;
final String whichAccount;
 ChangeScreen({required this.name,this.onTap,required this.whichAccount});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
         Text(
         whichAccount,
          style: const TextStyle(color: Colors.blue, fontSize: 15),
        ),
       const SizedBox(
          height: 10,
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child:  Text(
            name,
            style: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        )
      ],
    );
  }
}
