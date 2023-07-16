import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cubit.dart';
import '../bloc/states.dart';

class MyBlocHomePage extends StatelessWidget {
  const MyBlocHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MyAppCubit(MyAppInitialState()),
      child: BlocConsumer<MyAppCubit, MyAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Simple Bloc',
            themeMode: MyAppCubit.get(context).isLight? ThemeMode.light: ThemeMode.dark,
            theme: ThemeData(primaryColor: Colors.white),
            darkTheme: ThemeData(canvasColor: Colors.blueGrey),
            home: Scaffold(
              appBar: AppBar(
                title: const Text("Bloc Simple"),
              ),
              body: Center(
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.labelLarge!,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'This Button has been pushed',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(height: 20),
                      Text(
                          'Using BlocCubit default: ${ MyAppCubit.get(context).counter}'),
                    
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed:
                    MyAppCubit.get(context).incrementCounter,
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
                        value: MyAppCubit.get(context).isLight,
                        onChanged: (val) =>
                            MyAppCubit.get(context).changeMode(val),
                      ),
                      const Text("Light Mode"),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
