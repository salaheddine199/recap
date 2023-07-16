import 'package:flutter/material.dart';

testStream() {
  // we call it form main.

  final myStream = Stream.periodic(Duration(milliseconds: 500), (a) => a + 10);

  //myStream.listen((event) {print(event);}); // this == the next 2 inst:
  final sub = myStream.listen((event) {
    print(event);
  });
  sub.onData((data) {
    data > 20 ? sub.cancel() : print(data);
  });

  // this take myStream and filter it
  final myStream2 = myStream.where((event) => event % 2 == 0);
  final sub2 = myStream2.listen((event) {
    print(event);
  });
  sub2.onData((data) {
    data > 40 ? sub2.cancel() : print(data);
  });
}

class StreamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 2), (a) => a),
      builder: (cntx, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
                title: Text((snapshot.data! < 10)
                    ? "${snapshot.data}"
                    : "Stream Test")),
            body: Center(
              child: snapshot.connectionState == ConnectionState.waiting
                  ? const CircularProgressIndicator()
                  : const Text("Done"),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text(
                "There is no data",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
