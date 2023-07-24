import 'package:flutter/material.dart';

import 'acrchived_tasks.dart';
import 'done_tasks.dart';
import 'new_tasks.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}
class _BottomNavBarState extends State<BottomNavBar> {

  int _currentIndex = 0;
  List<Widget> bodyList =const  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: bodyList[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child:const  Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        elevation: 25.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: "Done",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: "Archived",
          ),
        ],

      ),
    );
  }
}
