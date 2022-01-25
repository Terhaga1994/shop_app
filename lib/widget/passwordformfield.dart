import 'dart:ffi';

import 'package:flutter/material.dart';

class PassswordTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String name;
  final void Function()? onTap;
final String? Function(String?)? onChanged;
final String? Function(String?)? onSaved;

final TextEditingController? controler;
  final bool obseText;
  PassswordTextFormField(
      {required this.name,this.onSaved, this.validator, this.onTap,this.controler, required this.obseText,this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: false,
        controller: controler,
        onSaved: onSaved,
        obscureText: obseText,
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        validator: validator,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: onTap,
              child: Icon(
                obseText == true ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            iconColor: Colors.blue,
            prefixIcon: const Icon(
              Icons.vpn_key,
            ),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: name,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));
  }
}
