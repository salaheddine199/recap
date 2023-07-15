import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../person_model.dart';
import 'states.dart';

class PersonCubit extends Cubit<PersonStates>{
  PersonCubit(PersonStates initialState) : super(initialState); //PersonInitialState()

  static PersonCubit get(context) => BlocProvider.of(context);


  // List<PersonModel> personList = [
  //   PersonModel(name: "Salah", age: 21, spec: "flutter"),
  //   PersonModel(name: "Mohamed",age:  20,spec: "java"),
  // ];
  //
  // void insertToList(PersonModel person){
  //   personList.add(person);
  //   emit(PersonInsertState());
  // }
  // void deleteFromList(PersonModel person){
  //   personList.remove(person);
  //   emit(PersonDeleteState());
  // }

  // Database:
  late Database database;
  List<PersonModel> personListDatabase = [];


  void createOurDatabase() async{
    database = await openDatabase(
      'blocDatabase.db',
      version: 1,
      onCreate: (database, version){
        print('database created');
        database.execute('CREATE TABLE person (name TEXT, age INTEGER, spec TEXT )',)
            .then((value) => print('table created'))
            .catchError((error) => print('error while creating table'));
      },
      onOpen: (database){
        print('database opened');

        //getFromDatabase(database);
        // getFromDatabaseMap().then((value) {
        //   personListDatabase = value; //print(listOfMedications);
        // });
        getFromDatabase(database);

      }
    );
  }

  void insertToDatabase(PersonModel person){
    database.transaction((txn) {

      return txn.rawInsert('INSERT INTO person VALUES ("${person.name}", "${person.age}", "${person.spec}" )')
          .then((value){print('inserted successfully');})
          .catchError((error) => print('error while inserting'));
      //return null;
    }).then((value) {

      getFromDatabase(database);

      emit(PersonInsertDatabaseState());


    }); // then emit

    //getFromDatabase(database);

  }

  void deleteFromDatabase(PersonModel person){
     database.rawDelete('DELETE FROM person WHERE name = ?', ['${person.name}']).then((value){


       getFromDatabase(database);

       emit(PersonDeleteDatabaseState());
     });

     //getFromDatabase(database);
  }

  List<PersonModel> getFromDatabase(Database database) {
    //emit(PersonGetDatabaseState());
    database.rawQuery('SELECT * FROM person').then((value){
      personListDatabase.clear();
      for(var item in value)
        personListDatabase.add(  PersonModel.fromJson(item) );
    });
    return personListDatabase; // empty list

  }

  // Future<List<Map>> getFromDatabaseTEstFutureBuilder(database) async {
  //   return await database.rawQuery('SELECT * FROM person');
  // }





}