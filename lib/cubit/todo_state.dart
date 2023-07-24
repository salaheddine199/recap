part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class ChangeBottomSheetState extends TodoState{}
class ChangeScreenIndexState extends TodoState{}

// database
// class InsertTaskState extends TodoState{}
class RefreshTaskState extends TodoState{}
class LoadingTaskState extends TodoState{}
