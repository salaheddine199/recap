import 'package:flutter/material.dart';

class User {
  final int id;
  final String name;
  final String number;

  User({
    required this.id,
    required this.name,
    required this.number,
  });
}

class UserDesign extends StatelessWidget {

  List<User>  userList = [
    User(id: 1,name: "Salah Edddine",number:"0776570722"),
    User(id: 2,name: "Amine",number:"28554"),
    User(id: 3,name: "Anfel",number:"057415112"),
    User(id: 1,name: "Salah Edddine",number:"0776570722"),
    User(id: 2,name: "Amine",number:"28554"),
    User(id: 3,name: "Anfel",number:"057415112"),
    User(id: 1,name: "Salah Edddine",number:"0776570722"),
    User(id: 2,name: "Amine",number:"28554"),
    User(id: 3,name: "Anfel",number:"057415112"),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(105, 271, 100 , .9),
      appBar: AppBar(
        title: const Text("User Design"),
        titleSpacing: 20.0,
        //backgroundColor: Colors.grey[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (_, index) => buildOurItem(userList[index]),
          separatorBuilder: (_, index) => const Padding(
            padding:  EdgeInsetsDirectional.only(start: 20.0),
            child: Divider(
              thickness: 1,
            ),
          ),
          itemCount: userList.length,
        ),
      ),
    );
  }

  Widget buildOurItem(User user) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            child: Text(
              "${user.id}",
              style:const  TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                user.name,
                style:const  TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                user.number,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
