import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home.dart';
import 'shared/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        canvasColor: Colors.black38,
      ),
      theme: ThemeData(canvasColor: Colors.white70),
      themeMode: ThemeMode.light,
      home: MyHomePage(),
      // home: TestingDB(),
    );
  }
}
