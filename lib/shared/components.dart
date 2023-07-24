import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

Widget defaultButton({
  required String text,
  required Function() onPress,
  bool isUpperCase = false,
  double width = double.infinity,
  Color bgColor = Colors.teal,
  double radius = 10.0,
  EdgeInsets padding = const EdgeInsets.all(0),
  EdgeInsets margin= const EdgeInsets.all(0),
  // additional
  Color textColor = Colors.white,
  double height = 40.0,
  //BorderRadius radius = BorderRadius.zero,
}) =>
    Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      child: MaterialButton(
        onPressed: onPress,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontSize: 22,
            color: textColor,
          ),
        ),
      ),
    );

Widget defaultFormField({
  required String? Function(String?)? validFun,
  required String text,
  TextStyle textStyle = const TextStyle(),
  required TextInputType keyBoardType, // think it's not required default .text
  required TextEditingController controller,
  required IconData prefix, // think it's not required
  IconData? suffix, // I did both of these is the same attribute
  Function()? suffixPressed, // IconButton suffixIcon
  EdgeInsets padding = const EdgeInsets.all(0),
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  FocusNode? focus,
  bool isClickable = true,
  bool isPassword = false,
  bool onlyRead = false,
}) =>
    TextFormField( 
      readOnly: onlyRead,
      //showCursor: onlyRead,
      focusNode: focus,
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyBoardType,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validFun,
      enabled: isClickable,
      decoration: InputDecoration(
        contentPadding: padding,
        labelText: text,
        labelStyle: textStyle,
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null // not sure if the test is necessary
            ? IconButton(
                icon: Icon(suffix),
                onPressed: suffixPressed,
              )
            : null,
      ),
    );
