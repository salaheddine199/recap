// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:recap_awdi/simple_provider/my_provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<MyProvider>(
//         create: (context) => MyProvider(),
//         child: const MyHomePage(),
//       );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SimpleProvider',
//       themeMode: Provider.of<MyProvider>(context).themeMode,
//       theme: ThemeData(primaryColor: Colors.white),
//       darkTheme: ThemeData(canvasColor: Colors.blueGrey),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Provider Simple"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'This Button has been pushed',
//               ),
//               Text(
//                 '${Provider.of<MyProvider>(context).counter} many times',
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: Provider.of<MyProvider>(context, listen: false).incrementCounter,
//           tooltip: 'Increment',
//           child: const Icon(Icons.add),
//         ), // This trailing comma makes auto-formatting nicer for build methods.
//         drawer: Drawer(
//           child: DefaultTextStyle(
//             style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//             child: Row(
//               children: [
//                 const Text("Dark Mode"),
//                 Switch(
//                   value: Provider.of<MyProvider>(context, listen: true).isLight,
//                   onChanged: (val) => Provider.of<MyProvider>(context, listen: false)
//                       .changeMode(val),
//                 ),
//                 const Text("Light Mode"),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
