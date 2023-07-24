// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recap_awdi/cubit/todo_cubit.dart';
import 'package:recap_awdi/screens/archive_tasks.dart';
import 'package:recap_awdi/screens/done_tasks.dart';
import 'package:recap_awdi/screens/new_tasks.dart';

import '../models/task_model.dart';
import '../shared/widgets/insert_task_fields.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List _bodyPage = const [
    NewTasks(),
    DoneTasks(),
    ArchivedTasks(),
  ];
  final List<String> _titlePage = const [
    "New Tasks",
    "Done Tasks",
    "Archived Tasks",
  ];

  // var mysqlite = DatabaseSQlite();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _timeController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => TodoCubit()..cubitRefreshTasks()),
      child: BlocConsumer<TodoCubit, TodoState>(
        listener: (BuildContext context, TodoState state) {},
        builder: (BuildContext context, TodoState state) {
          // bool isBottomSheet = BlocProvider.of<TodoCubit>(context).isBottomSheet;
          // int currentIndex = BlocProvider.of<TodoCubit>(context).currentIndex;
          var cubit = BlocProvider.of<TodoCubit>(context);

          return Scaffold(
            resizeToAvoidBottomInset: true, // Set this to true
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(
                  _titlePage[cubit.currentIndex]), //Text("Todo Application"),
              centerTitle: true,
            ),
            body: _bodyPage[cubit.currentIndex],
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                if (BlocProvider.of<TodoCubit>(context).isBottomSheet) {
                  if (_formKey.currentState!.validate()) {
                    print("title = ${_titleController.text}");
                    print("time = ${_timeController.text}");
                    print("date = ${_dateController.text}");

                    // int idInserted = await mysqlite.insertToDbTask(
                    // TaskModel(
                    //   title: _titleController.text,
                    //   time: _timeController.text,
                    //   date: _dateController.text,
                    //   status: "new",
                    // ));
                    int idInserted = await BlocProvider.of<TodoCubit>(context)
                        .cubitInsertTasks(TaskModel(
                      title: _titleController.text,
                      time: _timeController.text,
                      date: _dateController.text,
                      status: "new",
                    ));
                    // print(   "aaaaw the record number $indexOfNewRecord is inserted.");
                    if (idInserted > 0) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Inserted Successfully"),
                        behavior: SnackBarBehavior
                            .floating, // Snack bar floats above the bottom navigation bar
                        margin: EdgeInsets.only(
                            bottom: 16.0,
                            left: 8.0,
                            right:
                                8.0), // Set margin to position the snack bar at the bottom
                        duration: Duration(
                            seconds:
                                3), // Set the duration for how long the snack bar should be visible
                      ));
                    } else {
                      print("Error when inserting the new row, homepage.dart");
                    }
                    Navigator.pop(context);
                    cubit.changeBottomSheet(false);
                  }
                } else {
                  cubit.changeBottomSheet(true);

                  _titleController.clear();
                  _timeController.clear();
                  _dateController.clear();
                  _scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) {
                          return InsertTaskFields(
                            formKey: _formKey,
                            titleController: _titleController,
                            timeController: _timeController,
                            dateController: _dateController,
                          );
                        },
                        elevation: 20,
                      )
                      .closed
                      .then((value) {
                        cubit.changeBottomSheet(false);
                      });
                }
              },
              child: Icon(!cubit.isBottomSheet ? Icons.add : Icons.check),
            ),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.currentIndex,
                onTap: (newIndex) {
                  cubit.changeIndex(newIndex);
                },
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
                    icon: Icon(Icons.archive),
                    label: "Archived",
                  )
                ]),
          );
        },
      ),
    );
  }
}
