import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recap_awdi/cubit/todo_cubit.dart';
import 'package:recap_awdi/models/task_model.dart';

import '../shared/widgets/card_item.dart';
import '../shared/widgets/no_tasks.dart';

class DoneTasks extends StatelessWidget {
  const DoneTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<TaskModel> doneTasks = BlocProvider.of<TodoCubit>(context)
            .myTasks
            .where((task) => task.status == "done")
            .toList();

        return state is LoadingTaskState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : doneTasks.isEmpty
                ? const NoTasksScreen()
                : ListView.separated(
                    itemBuilder: (context, index) => MyCardItem(
                      task: doneTasks[index],
                      deleteItem: () async {
                        print("Delete the item with index = $index");
                        int isDeleted = await BlocProvider.of<TodoCubit>(
                                context)
                            .cubitDeleteTaskId(
                                // BlocProvider.of<TodoCubit>(context).myTasks[index].id
                                doneTasks[index].id);
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
                    itemCount: doneTasks.length,
                  );
      },
    );
  }
}
