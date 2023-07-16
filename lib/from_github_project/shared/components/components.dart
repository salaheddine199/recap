import 'package:flutter/material.dart';

Widget myButton({
  required String text,
  required VoidCallback? function,
  bool isUpperCase = true,
  double width = double.infinity,
  Color background = Colors.blue,

  double height = 40.0,
  Color textColor = Colors.white,
  EdgeInsets margin = const EdgeInsets.all(0.0),
  EdgeInsets padding = const EdgeInsets.all(0.0),
  BorderRadius radius = BorderRadius.zero,
}){
  return Container(
    decoration: BoxDecoration(
      borderRadius: radius,
      color: background,
    ),
    height: height,
    padding: padding,
    width: width,
    margin: margin,
    child: MaterialButton(
      onPressed: function,
      child: Text(
        isUpperCase? text.toUpperCase(): text,
        style: TextStyle(
          color: textColor,
          fontSize: 22,
        ),
      ),
    ),
  );
}


typedef StringCallback = String? Function(String?);

Widget myTextField({
  required TextEditingController controller,
  required StringCallback validator,
  required String text,
  required Icon prefixIcon,
  IconButton? suffixIcon,
  bool isPassword = false,
  TextInputType keyboardType = TextInputType.text,
}){
  return TextFormField(
    controller: controller,
    obscureText: isPassword,
    keyboardType: keyboardType,
    validator: validator,
    decoration: InputDecoration(
      labelText: text,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(),
    ),
  );
}