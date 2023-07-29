import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: null,
    );
  }
}






/*
  //give focus and remove it from TextField and also remove Keyboard


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: YourPage(),
    );
  }
}
class YourPage extends StatelessWidget {

  FocusNode focusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              focusNode: focusNode,
            ),
            SizedBox(height: 10,),
            RaisedButton(child: Text("UP"),onPressed: (){
              FocusScope.of(context).requestFocus(focusNode);
            },),
            SizedBox(height: 10,),
            RaisedButton(child: Text("DOWN"),onPressed: (){
              focusNode.unfocus();
            },),
          ],
        )
    );
  }

}*/
