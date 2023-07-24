import 'package:flutter/material.dart';

class AsyncAwait extends StatefulWidget {
  @override
  _AsyncAwaitState createState() => _AsyncAwaitState();
}
class _AsyncAwaitState extends State<AsyncAwait> {
  getDataInt() async{
      // what we used to do
    //Future.delayed(Duration(seconds: 1), () => 1).then((value) => print(value));
      // instead of then , catchError, we'll use async, await:
      // without await the return type is Future<int> not int but:
    try{
      int a = await Future.delayed(Duration(seconds: 1), () => throw Exception("Invalid w 5las"));
      print("hawdi a = $a");
    }catch(e){
      print("Error = $e");
    }

  }

  void getDataString() async{
       // what we used to do
    // Stream.periodic(Duration(milliseconds: 500), (a) => a).listen((event) {print(event);});

    Stream<int> myStream =  Stream.periodic(const Duration(milliseconds: 500), (a) => a);
    await for( final value in myStream){
      if(value> 10) break;
      print(value);
    }

  }
  Stream<int> getDataStream(){
    Stream<int> myStream =  Stream.periodic(const Duration(milliseconds: 500), (a) => a);
    return myStream;
  }

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$i: Async and Await "),),
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            await for( final value in getDataStream()){
              setState(() {
                i = (value<10? value:0);
              });
            }
          },
          child:const Text("Click me"),
        ),
      )
    );
  }
}
