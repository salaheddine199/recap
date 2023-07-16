import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_getx.dart';
import 'cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyGetx());

    return MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  final MyGetx _getx = Get.find();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyGetx>(
      init: _getx,
      builder: (ctx) =>MaterialApp(
      title: 'SimpleProvider',
      // themeMode: Provider.of<MyProvider>(context).themeMode, // both of these methods work.
      themeMode: //ThemeMode.light,
       _getx.isLight
          ? ThemeMode.light
          : ThemeMode.dark,
      theme: ThemeData(primaryColor: Colors.white),
      darkTheme: ThemeData(canvasColor: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Provider Simple"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'This Button has been pushed',
              ),
              Text(
                '${_getx.counter} many times',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _getx.incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
        drawer: Drawer(
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            child: Row(
              children: [
                const Text("Dark Mode"),
                Switch(
                  value: _getx.isLight,
                  onChanged: (val) => _getx.changeMode(val),
                ),
                const Text("Light Mode"),
              ],
            ),
          ),
        ),
      ),
    
    ),
      
      
      
       );
  }
}
