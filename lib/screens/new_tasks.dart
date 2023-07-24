import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recap_awdi/cubit/todo_cubit.dart';
import 'package:recap_awdi/models/task_model.dart';
import 'package:recap_awdi/shared/widgets/no_tasks.dart';

import '../shared/widgets/card_item.dart';

class NewTasks extends StatelessWidget {
  const NewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    // if we didn't set the BlocConsumer; it works but we need to do ctrl+s
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {},
      builder: (context, state) {
        // List<TaskModel> newTasks = [];
        // BlocProvider.of<TodoCubit>(context).myTasks.map((task) {
        //   if (task.status == "new") {
        //     newTasks.add(task);
        //   }
        // });

        // another way using one line:
        List<TaskModel> newTasks = BlocProvider.of<TodoCubit>(context)
            .myTasks
            .where((task) => task.status == "new")
            .toList();

        return state is LoadingTaskState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : newTasks.isEmpty
                ? const NoTasksScreen()
                : ListView.separated(
                    itemBuilder: (context, index) => MyCardItem(
                      task: newTasks[index],
                      deleteItem: () async {
                        print("Delete the item with index = $index");
                        int isDeleted = await BlocProvider.of<TodoCubit>(
                                context)
                            .cubitDeleteTaskId(
                                // BlocProvider.of<TodoCubit>(context).myTasks[index].id
                                newTasks[index].id);
                        if (isDeleted == 1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Deleted Successfully"),
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
                      },
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                      height: 2,
                    ),
                    itemCount: newTasks.length,
                  );
      },
    );
  }
}
