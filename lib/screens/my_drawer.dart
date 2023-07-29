import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recap_awdi/screens/settings_screen.dart';
import 'package:recap_awdi/shared/components.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .4,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_pin_outlined,
                        size: 80,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "News Application Information",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Center(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("Settings"),
                      leading: const Icon(Icons.settings),
                      contentPadding: const EdgeInsets.all(12),
                      onTap: () {
                        navigateTo(context, const SettinsScreen());
                      },
                    ),
                    ListTile(
                      title: const Text("About The Application"),
                      leading: const Icon(Icons.help_outline_rounded),
                      contentPadding: const EdgeInsets.all(12),
                      onTap: () => _showApplicationInfoBottomSheet(context),
                    ),
                    ListTile(
                      title: const Text("About Us"),
                      leading: const Icon(Icons.co_present_outlined),
                      contentPadding: const EdgeInsets.all(12),
                      onTap: () => _showDeveloperInfoBottomSheet(context),
                    ),
                    ListTile(
                      title: const Text("Exit"),
                      leading: const Icon(
                        Icons.exit_to_app,
                        color: Colors.red,
                      ),
                      contentPadding: const EdgeInsets.all(12),
                      onTap: () {
                        _showExitConfirmationDialog(context);
                      },
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void _showExitConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit Confirmation'),
          content: const Text('Are you sure you want to exit the application?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Return false to cancel
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Return true to exit
              },
              child: const Text('Exit'),
            ),
          ],
        );
      },
    ).then(
      (value) {
        if (value == true) {
          exit(0); // Close the application
        }
      },
    );
  }

  void _showDeveloperInfoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  'assets/images/profile picture.jpg',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Merzougui Salah Eddine',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Flutter Developer',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 16),
              Text(
                'Hi, I\'m Merzougui Salah Eddine! I\'m a passionate Flutter developer with several years of experience in creating beautiful and functional mobile applications. I love exploring new technologies and building exciting projects. Feel free to contact me at salahexe3@gmail.com for any inquiries or collaborations.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _showApplicationInfoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'News Application Using APIs and Bloc',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'This Application was created by Salah, following the udemy course of Abdallah, I have used bloc as a state managemet, dio for gettings APIs we need, shared preferences to store our data locally',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
