import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlTest extends StatelessWidget {

  String str = "Get The App";

  var url = "https://play.google.com/store/apps/details?id=com.facebook.lite";

  var url2 = "https://www.youtube.com/watch?v=PeI4BkFoHuE&t=2051s";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("URl Launcher")),
      body: Center(
          child: ElevatedButton(
        child: Text(str),
        onPressed: () async {
            // cuz it's Future<bool>
            // let's suppose the net is bad, wait, async will be necessary.
          try {
            await canLaunchUrl(Uri.parse(url))
                ? await launchUrl(Uri.parse(url),) //,forceWebView: true, enableJavaScript: true
                : throw "Could not Launch Url";
          } catch (e) {
            print(e.toString());
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title:  const Text("Alert"),
                  content:  const Text("Could Not Launch"),
                  actions: [
                    TextButton(
                      child: const  Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      )),
    );
  }
}
