// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/todo_cubit.dart';
import '../../models/task_model.dart';
import 'insert_task_fields.dart';

class MyCardItem extends StatelessWidget {
  final TaskModel task;
  final Function()
      deleteItem; // we could simply implement it here but we used this before addin BlocConsumer + it's good I knew how to do send it and work with it.
  MyCardItem({
    Key? key,
    required this.task,
    required this.deleteItem,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _timeController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<TodoCubit>(context);
        _titleController.text = task.title;
        _timeController.text = task.time;
        _dateController.text = task.date;

        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Dismissible(
            key: Key(task.id.toString()),
            direction: task.status == "done"
                ? DismissDirection.endToStart
                : task.status == "archived"
                    ? DismissDirection.startToEnd
                    : DismissDirection.horizontal,
            onDismissed: (DismissDirection direction) async {
              if (direction == DismissDirection.startToEnd) {
                // here make it done:
                await cubit.cubitUpdateTaskId(
                  TaskModel(
                    title: task.title,
                    time: task.time,
                    date: task.date,
                    status: "done",
                    id: task.id,
                  ),
                );
                print("From start to end: the task hda raho done dok");
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Switch to done tasks"),
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 3),
                ));
              } else if (direction == DismissDirection.endToStart) {
                cubit.cubitUpdateTaskId(
                  TaskModel(
                    title: task.title,
                    time: task.time,
                    date: task.date,
                    status: "archived",
                    id: task.id,
                  ),
                );
                print("From end to start the task hda raho archived doka");
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Switch to archived tasks"),
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 3),
                ));
              }
            },
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          task.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 15),
                          child: Text(
                            "Time: ${task.time}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 15),
                          child: Text(
                            "Date: ${task.date}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.question_mark_outlined,
                            color: Colors.black,
                            size: 24,
                          ),
                          onPressed: () async {
                            cubit.changeBottomSheetUpdate(true);
                            showModalBottomSheet(
                              elevation: 20,
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return InsertTaskFields(
                                  formKey: _formKey,
                                  titleController: _titleController,
                                  timeController: _timeController,
                                  dateController: _dateController,
                                  isUpdateProcess: true,
                                  updateFunction: () async {
                                    if (_formKey.currentState!.validate()) {
                                      print("title = ${_titleController.text}");
                                      print("time = ${_timeController.text}");
                                      print("date = ${_dateController.text}");

                                      if (_titleController.text == task.title &&
                                          _dateController.text == task.date &&
                                          _timeController.text == task.time) {
                                        print(
                                            "No updating, the user DID not change anything ###");
                                      } else {
                                        print(
                                            "Update the item ########### card_item.dart");
                                        int isUpdated = await cubit
                                            .cubitUpdateTaskId(TaskModel(
                                          id: task
                                              .id, // id never changes : new id = old id
                                          title: _titleController
                                              .text, // /?? "New Title :p",
                                          time: _timeController.text,
                                          date: _dateController.text,
                                          status: task.status,
                                        ));
                                        if (isUpdated == 1) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content:
                                                  Text("Updated Successfully"),
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
                                            ),
                                          );
                                        }
                                      }

                                      Navigator.pop(context);
                                      cubit.changeBottomSheetUpdate(false);
                                    }
                                  },
                                );
                              },
                            ).whenComplete(() {
                              cubit.changeBottomSheetUpdate(false);
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 24,
                          ),
                          onPressed: deleteItem,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
