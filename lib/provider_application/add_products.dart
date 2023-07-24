import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ! Nothing is this class

class AddProduct extends StatelessWidget {
  AddProduct({Key? key}) : super(key: key);

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageUrlCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
    );
  }

  Widget _textField(String title, String desc, controller) {
    return Platform.isIOS
        ? CupertinoTextField(
            placeholder: title,
            placeholderStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            controller: controller,
          )
        : TextField(
            decoration: InputDecoration(
              labelText: title,
              hintText: desc,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.4),
              ),
            ),
            controller: controller,
          );
  }
}
