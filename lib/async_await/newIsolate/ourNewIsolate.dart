import 'dart:io';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IsolateCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create A New Isolate")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Click me"),
          onPressed: () {
            print("Main Isolate Before Function");

            Isolate.spawn(blockApp, 1);
            compute(blockApp, 2);
            print("Main Isolate End Function");
          },
        ),
      ),
    );
  }
}

// top level function:
blockApp(int sec) {
  print("new isolate awdi Begin");
  sleep(Duration(seconds: sec));
  print("new isolate awdi End");
}
