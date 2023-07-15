import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'person_model.dart';

class PersonList extends StatelessWidget {

  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var _nameController = TextEditingController();
  var _ageController = TextEditingController();
  var _specController = TextEditingController();
  bool _isBottomSheet = false;

  PersonList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PersonCubit(PersonInitialState())..createOurDatabase(),
      child: BlocConsumer<PersonCubit, PersonStates>(
        listener: (context, state) {},
        builder: (context, state) {
          //print('our list : ${PersonCubit.get(context).personListDatabase}');
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: const Text("List Of Persons"),
            ),
            body: PersonCubit.get(context).personListDatabase.isEmpty
                ? const Center(
              child: Text(
                'NO Person added yet!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
                : Center(
              child: ListView.separated(
                itemBuilder: (context, index) => buildOurItem(
                    PersonCubit.get(context).getFromDatabase(PersonCubit.get(context).database)[index],
                    context,
                ),
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1.0,
                ),
                itemCount: PersonCubit.get(context).personListDatabase.length,
              ),
            ),

            /*
            FutureBuilder(
              future: PersonCubit.get(context).getFromDatabaseTEstFutureBuilder(PersonCubit.get(context).database),
              builder: (context, snapshot){
                //List<PersonModel> list = snapshot.data;
                if(snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                // else if(snapshot.hasError)
                //   return Center(child: Text("Error",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,),),);
                else if(snapshot.data.length == 0) return Center(
                  child: Text(
                    'NO Person added yet!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
                return Center(
                  child: ListView.separated(
                    itemBuilder: (context, index) => buildOurItem(
                        PersonCubit.get(context).personListDatabase[index], context),
                    separatorBuilder: (context, index) => Divider(
                      thickness: 1.0,
                    ),
                    itemCount: PersonCubit.get(context).personListDatabase.length,
                  ),
                );
              },
            ),
             */

            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {

                if(_isBottomSheet){

                  // we suppose that the fields are correct without validation:
                  PersonCubit.get(context).insertToDatabase(
                    PersonModel(name: _nameController.text, age: int.parse(_ageController.text) , spec: _specController.text),
                  );

                  _isBottomSheet = false;
                  _nameController.clear();
                  _ageController.clear();
                  _specController.clear();
                  Navigator.pop(context);

                }
                else{
                  _isBottomSheet = true;
                  _scaffoldKey.currentState!.showBottomSheet(
                        (context) => Container(
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            myTextField(
                              controller: _nameController,
                              validator: (String? value){
                                if(value == null){
                        return "This field must not be null";
                      }
                      else if(value.isEmpty) return "this field must not be empty";
                                return null;
                              },
                              text: "Name:",
                              prefixIcon: Icon(Icons.person),
                            ),
                            SizedBox(height: 20,),
                            myTextField(
                              keyboardType: TextInputType.number,
                              controller: _ageController,
                              validator: (String? value){
                                if(value == null){
                        return "This field must not be null";
                      }
                      else if(value.isEmpty) return "this field must not be empty";
                                return null;
                              },
                              text: "Age:",
                              prefixIcon: Icon(Icons.message),
                            ),
                            SizedBox(height: 20,),
                            myTextField(
                              controller: _specController,
                              validator: (String? value){
                                if(value == null){
                        return "This field must not be null";
                      }
                      else if(value.isEmpty) return "this field must not be empty";
                                return null;
                              },
                              text: "specialty:",
                              prefixIcon: Icon(Icons.message),
                            ),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),
                    elevation: 25.0,
                  ).closed.then((value) {
                    _isBottomSheet = false;
                    _nameController.clear();
                    _ageController.clear();
                    _specController.clear();
                  });
                }

              },
              icon: Icon(Icons.add),
              label: Text("Add"),
            ),
          );
        },
      ),
    );
  }

  Widget buildOurItem(PersonModel person, context) => Padding(
    padding: const EdgeInsets.all(
      20.0,
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 30,
          child: Text(
            '${person.age}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                person.name,
                style: const  TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                person.spec,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon:const  Icon(
            Icons.delete_forever_rounded,
            color: Colors.red,
          ),
          onPressed: () {
            PersonCubit.get(context).deleteFromDatabase(person);
          },
        ),
      ],
    ),
  );

}

