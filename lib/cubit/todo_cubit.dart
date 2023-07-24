import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/task_model.dart';
import '../shared/sqldb.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  bool isBottomSheet = false;
  bool isBottomSheetUpdate = false;
  int currentIndex = 0;

  void changeIndex(int newIndex) {
    currentIndex = newIndex;
    emit(ChangeScreenIndexState());
  }

  void changeBottomSheet(bool isShow) {
    isBottomSheet = isShow;
    emit(ChangeBottomSheetState());
  }

  void changeBottomSheetUpdate(bool isShow) {
    isBottomSheetUpdate = isShow;
    emit(ChangeBottomSheetState());
  }

  // database:
  List<TaskModel> myTasks = [];
  var mysqlite = DatabaseSQlite();

  // we can add either here or in sqflite file: after each insert/delete/update run refreshTask
  Future<int> cubitInsertTasks(TaskModel task) async {
    int idInserted = await mysqlite.insertToDbTask(task);

    // emit(InsertTaskState()); // I think we don't need this because we already emit the refresh everytime we insert!
    cubitRefreshTasks();

    return idInserted;
  }

  Future<int> cubitDeleteTaskId(int id) async {
    int isDeleted = await mysqlite.deleteDbTask(id: id);

    if (isDeleted > 0) {
      cubitRefreshTasks();
      // also emit delete if we use it
    }

    return isDeleted;
  }

  Future<int> cubitUpdateTaskId(TaskModel task) async {
    int isUpdated = await mysqlite.updateDbTask(task);
    if (isUpdated > 0) {
      cubitRefreshTasks();
      // also emit delete if we use it
    }
    return isUpdated;
  }

  void cubitRefreshTasks() async {
    print("***********************");
    emit(LoadingTaskState());
    myTasks = await mysqlite.readDbTask();
    emit(RefreshTaskState());
  }
}
