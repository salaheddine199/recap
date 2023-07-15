import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'bloc/bloc_observer.dart';
import 'controller/cache_helper.dart';
import 'view/my_bloc_hompage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
 await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyBlocHomePage();

  }
}
