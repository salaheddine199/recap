import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<MyProvider>(
    //     create: (context) => MyProvider(),
    //     child: const MyHomePage(),
    //   );

    //? in case we have more than one provider:
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyProvider()),
      ],
      child: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleProvider',
      themeMode: Provider.of<MyProvider>(context).themeMode,
      theme: ThemeData(primaryColor: Colors.white),
      darkTheme: ThemeData(canvasColor: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Provider Simple"),
        ),
        body: Center(
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.headlineMedium!,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'This Button has been pushed',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 20),
                //? the first way:
                Text(
                    'Using Provider default: ${Provider.of<MyProvider>(context).counter}'),
                //? another way to do it: read and watch: read = listen: false
                Text(
                    'Using read and watch : ${context.watch<MyProvider>().counter}'),
                //? A third way to do it, using consumers:
                Consumer<MyProvider>(
                  builder: (context, value, child) => Text(
                    'Using Consumers        : ${value.counter}',
                  ),
                ),
                //? 4th way: using selector:
                Selector<MyProvider, int>(
                  selector: (ctx, value) => value.counter,
                  // now the value we get from the builder is the value we set above: value.counter
                  builder: (ctx, value, child) => Text('Using Selector              : $value'),
                ),
                //? 5th way: also selector, but in one line:
                Text('Using simplier selector: ${context.select<MyProvider, int>((value) => value.counter)}'),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:
              // Provider.of<MyProvider>(context, listen: false).incrementCounter,
              //? another way to do it: read and watch:  read = listen: false
              context.read<MyProvider>().incrementCounter,
              //? we use here consumer and selector as well, but we need to wrap the button with them
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
                  value: Provider.of<MyProvider>(context, listen: true).isLight,
                  onChanged: (val) =>
                      Provider.of<MyProvider>(context, listen: false)
                          .changeMode(val),
                ),
                const Text("Light Mode"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
