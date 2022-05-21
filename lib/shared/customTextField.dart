import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;

  CustomTextField({this.hintText,this.controller,this.keyboardType,this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: Theme.of(context).accentColor
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,color: Theme.of(context).primaryColor
          ),
          borderRadius: BorderRadius.circular(30,)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,color: Theme.of(context).primaryColor
          ),
          borderRadius: BorderRadius.circular(30,)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,color: Theme.of(context).primaryColor
          ),
          borderRadius: BorderRadius.circular(30,)
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}