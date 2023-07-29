import 'package:flutter/material.dart';

class SomethingWrong extends StatelessWidget {
  const SomethingWrong({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 4),
          Icon(
            Icons.list_alt_rounded,
            size: 100,
            color: Colors.grey,
          ),
          Spacer(),
          Text(
            "Something Is Wrong!",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Spacer(flex: 4),
        ],
      ),
    );
  }
}
