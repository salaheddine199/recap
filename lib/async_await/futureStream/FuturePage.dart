import 'package:flutter/material.dart';

// we'll call it from main
testFuture(){
      // Future Constructors:

  //final myFuture =             Future( ()  =>print(2) );
  //final Future<int> myFuture = Future( info ) ;

      // if you are sure of the value you wanna return it:
  //final Future<int> mydFuture = Future.value(2);

  //final Future<int> myFuture = Future.delayed(Duration(seconds: 2), info);
  final Future<int> myFuture = Future.delayed(Duration(seconds: 2), ()=> info2(3) );

      // because myFuture type is not "int" it's Future<int>
      // we should do this for displaying its content:
  myFuture.then((value) => print(value)).catchError((err) => print(err));


  print(1); // this will be executed b4 "print(2)"

}
int info() =>  2; // return 2;
int info2(int a) => a;


class FuturePage extends StatelessWidget {
  //final myf = Future.delayed(Duration(seconds: 2), ()=> "say" );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  Future.delayed(const Duration(seconds: 2), ()=> "Say It :p" ), // myf,
      builder: (ctx, snapShot){
        return Scaffold(
          appBar: AppBar(title: Text(snapShot.hasData? "${snapShot.data}": "Future Test " )),
          body: Center(
            child: snapShot.connectionState == ConnectionState.waiting
                ? const CircularProgressIndicator()
                : const Text("Done"),
          ),
        );
      },
    );
  }
}

