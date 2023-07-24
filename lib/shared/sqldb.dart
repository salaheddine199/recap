import '../models/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseSQlite {
  static String dbName = "HHtestingDB.db";
  static int dbVersion = 1;

  static Database? _database;
  Future<Database> get database async => _database ??=
      await initialDB(); // if null, initial database, else just return it.

  // the main method to create the database at first:
  Future<Database> initialDB() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, dbName); //  path/testingDB.db

    return await openDatabase(path,
        version: dbVersion,
        onCreate: _onCreate,
        onOpen: _onOpen,
        onUpgrade: _onUpgrade);
  }

  Future _onCreate(Database db, int version) async {
    // we might have to try catch this block:
    try {
      await db.execute('''
CREATE TABLE tasks (
  id INTEGER NOT NULL PRIMARY KEY,
  title TEXT NOT NULL,
  date TEXT NOT NULL,
  time TEXT NOT NULL,
  status TEXT NOT NULL  
) 
    ''');
      print("Database and table note created #######################");
    } catch (e) {
      print("Error in _onCreate function that creates the db, dbfile.dart");
    }
  }

  Future _onOpen(Database db) async {
    // tasksList = await readDbTask();
    print("on open called ###################");
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print("on upgrade method  ###########################");
    return null;
  }

  Future<int> insertToDbTask(TaskModel task) async {
    Database myDb = await database;
    // await myDb.transaction((txn) async {
    //   int id1 = await txn.rawInsert(
    //       'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
    //   print('inserted1: $id1');
    //   int id2 = await txn.rawInsert(
    //       'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
    //       ['another name', 12345678, 3.1416]);
    //   print('inserted2: $id2');
    // });
    try {
      int idInserted = await myDb.rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES(?, ?, ?, ?)',
          [task.title, task.date, task.time, task.status]);

      print("the raw number $idInserted inserted #################");
      return idInserted;
    } catch (e) {
      print("Error in insert function, dbfile.dart");
      return -1;
    }
  }

  Future<int> deleteDbTask({required int id}) async {
    Database myDb = await database;
    try {
      int count =
          await myDb.rawDelete('DELETE FROM tasks WHERE id = ?', ['$id']);
      // assert(count == 1); // if it's false (no deleting) throw an error
      return count;
    } catch (e) {
      print("Error in delete function, dbfile.dart");
      return -1;
    }
  }

  Future<int> updateDbTask(TaskModel task) async {
    Database myDb = await database;

    try {
      int count = await myDb.rawUpdate(
          'UPDATE tasks SET title = ?, date = ?, time = ?, status = ? WHERE id = ?',
          [task.title, task.date, task.time, task.status, task.id]);

      return count;
    } catch (error) {
      print("Error while updating the row $error, sqflitefile.dart");
      return -1;
    }
  }

  Future<List<TaskModel>> readDbTask() async {
    Database myDb = await database;

    try {
      List<Map> list = await myDb.rawQuery('SELECT * FROM tasks');

      // converting map to taskModel list:
      List<TaskModel> taskList = [];
      for (var map in list) {
        TaskModel task = TaskModel(
          id: map['id'] as int, // Convert to int
          title: map['title'] as String,
          time: map['time'] as String,
          date: map['date'] as String,
          status: map['status'] as String,
        );
        taskList.add(task); // Add the TaskModel object to the list
      }
      // for (var val in taskList) {
      //   print(
      //       'id: ${val.id}, name: ${val.title},time: ${val.time}, date: ${val.date}, status: ${val.status}');
      // }
      return taskList;
    } catch (e) {
      print("Error in get the database content function, dbfile.dart");
      return [];
    }
  }

  void deleteDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, dbName);
    try {
      await deleteDatabase(path);
      _database = null;
      print("Database deleted ##############");
    } catch (e) {
      print("Error in deleting the dataase function, dbfile.dart");
    }
  }
}
