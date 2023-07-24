import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

/*
http12Test() async{
  // this code is from the official site of flutter

// This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse['totalItems'];
    print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

}
*/
class GetDataFromAPI extends StatelessWidget {
  Future<Map?> fetchPhotos() async {
    //try{
    //var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';
    var res =
        await http.get(Uri.parse("http://jsonplaceholder.typicode.com/photos"));
    if (res.statusCode == 200) {
      // this method convert from string to object of json
      var jsonResponse = convert.jsonDecode(res.body);
      return jsonResponse;
      //print(jsonResponse[0]["title"]);
    } else
      {print("statusCode= ${res.statusCode}"); 
      return null;}

    //}catch(e){
    //  print("Error= ${e.toString()}");
    //}
  }

  // this method will be executed once this window is open.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("How to get data from API")),
      body: Center(
        child: FutureBuilder(
          future: fetchPhotos(),
          builder: (ctx, snapshot) {
            // snapshot != null // OR
            if (snapshot.connectionState == ConnectionState.waiting) {
              return  const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return ListView.builder(
                // this gave us only first 12 items,
                // we can remove this attribute, so we see all items.
                itemCount: 12,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(snapshot.data![index]['thumbnailUrl']),
                    ),
                    title: Text(snapshot.data![index]['title']),
                    subtitle: Text("${snapshot.data![index]['id']}"),
                  );
                },
              );
            } else {
              return  const  Scaffold(
                body: Center(
                  child: Text(
                    "There is no data",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
