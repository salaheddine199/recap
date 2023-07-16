import 'package:flutter/material.dart';

import 'api2Model/itsMain.dart';
import 'url0/urlLaunchr.dart';
import 'asyncAwait/asyncawait.dart';
import 'futureStream/streamPage.dart';
import 'futureStream/FuturePage.dart';
import 'url0/getdatafromapi.dart';
import 'newIsolate/ourNewIsolate.dart';

void main() {
  //testFuture();// test future's stuff
  //testStream();// test stream's stuff

  //testIterator(); // Generator iterator
  //textIterable(); // Generator iterable
  //                // Generator.

  //http12Test();// test http package

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            primary: Colors.purple,
            elevation: 30,
            shadowColor: Colors.greenAccent,
          ))),
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Home Page")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
               const SizedBox(
                height: 10,
              ),
              TextButton(
                child: const  Text("How to create a new isolate",
                    style: TextStyle(fontSize: 25)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IsolateCreate()),
                  );
                },
              ),
               const SizedBox(
                height: 20,
              ),
              TextButton(
                child: const  Text("Work with Future", style: TextStyle(fontSize: 25)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FuturePage()),
                  );
                },
              ),
               const SizedBox(
                height: 20,
              ),
              TextButton(
                child:  const Text("Work with Stream", style: TextStyle(fontSize: 25)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StreamPage()),
                  );
                },
              ),
               const SizedBox(
                height: 20,
              ),
              TextButton(
                child:  const Text("Work with Async && Await",
                    style: TextStyle(fontSize: 25)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AsyncAwait()),
                  );
                },
              ),
               const SizedBox(
                height: 20,
              ),
              TextButton(
                child:  const Text("Work with URL", style: TextStyle(fontSize: 25)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  UrlTest()),
                  );
                },
              ),
               const SizedBox(
                height: 20,
              ),
              TextButton(
                child:
                     const Text("Get Data from API", style: TextStyle(fontSize: 25)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GetDataFromAPI()),
                  );
                },
              ),
               const SizedBox(
                height: 20,
              ),
              TextButton(
                child: const  Text("API to Model", style: TextStyle(fontSize: 25)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ItsMain()),
                  );
                },
              ),
               const SizedBox(
                height: 20,
              ),
              const Image(
                image: NetworkImage(
                    "https://www.haveagonews.com.au/wp-content/uploads/2020/08/Carmelia.jpg"),
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}
