import 'package:flutter/material.dart';

class MyTextFormFeild extends StatelessWidget {
  final String? Function(String?)? validator;
  final String name;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onSaved;
  final TextEditingController? controler;
final Icon icon;
  MyTextFormFeild({
   this.onSaved,
    required this.name,
    this.validator,
   required this.icon,
   this.controler,
   this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.text,
        controller: controler,
        onSaved:onSaved ,
        onChanged: onChanged,
        validator: validator,
        
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            iconColor: Colors.blue,
               prefixIcon: icon,
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: name,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));
  }
}
