class TaskModel {
  int id; // int? id; // for now
  final String title;
  final String time;
  final String date;
  final String status;

  TaskModel({
    this.id = -100, // if id = -100 it means it's null (no value)
    required this.title,
    required this.time,
    required this.date,
    required this.status,
  });
}
