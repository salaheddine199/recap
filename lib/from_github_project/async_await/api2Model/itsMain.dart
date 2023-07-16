import 'package:flutter/material.dart';

import 'service/apiToModel.dart';
import 'model/Post.dart';

class ItsMain extends StatefulWidget {
  @override
  _ItsMainState createState() => _ItsMainState();
}

class _ItsMainState extends State<ItsMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api")),
      body: Center(
        child: null,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async{

          var p = PostApi();
          List<Post> data = await p.fetchData();


          for(final i in data){
            print("${i.id}");
            print("${i.userId}");
            print(i.title);
            print(i.body);
          }

        },
      ),
    );
  }
}
