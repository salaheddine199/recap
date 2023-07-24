import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components.dart';

class InsertTaskFields extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController timeController;
  final TextEditingController dateController;
  final bool isUpdateProcess;
  final Function()? updateFunction; // can be null ( won't even used if the var above is false(default value) )
  const InsertTaskFields({
    super.key,
    this.isUpdateProcess = false,
    this.updateFunction,
    required this.formKey,
    required this.titleController,
    required this.timeController,
    required this.dateController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.only(
          // it's not working
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      padding: const EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height * .5,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isUpdateProcess)
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Update Information",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              defaultFormField(
                validFun: (String? value) {
                  if (value == null) {
                    return "This field must not be null";
                  } else if (value.isEmpty) {
                    return "This field must no be null";
                  }
                  return null;
                },
                text: "Task Title",
                keyBoardType: TextInputType.text,
                controller: titleController,
                prefix: Icons.edit_document,
              ),
              const SizedBox(height: 15),
              defaultFormField(
                onlyRead: true,
                validFun: (String? value) {
                  if (value == null) {
                    return "This field must not be null";
                  } else if (value.isEmpty) {
                    return "This field must no be null";
                  }
                  return null;
                },
                text: "Task Time",
                keyBoardType: TextInputType.datetime,
                controller: timeController,
                prefix: Icons.watch_later_outlined,
                onTap: () async {
                  TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    timeController.text = time.format(context);
                    print(time.format(context));
                  }
                },
              ),
              const SizedBox(height: 15),
              defaultFormField(
                  onlyRead: true,
                  validFun: (String? value) {
                    if (value == null) {
                      return "This field must not be null";
                    } else if (value.isEmpty) {
                      return "This field must no be null";
                    }
                    return null;
                  },
                  text: "Task Date",
                  keyBoardType: TextInputType.datetime,
                  controller: dateController,
                  prefix: Icons.date_range,
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.utc(DateTime.now().year +
                          5), // DateTime.parse("2025-06-01")
                    );
                    if (date != null) {
                      dateController.text = DateFormat.yMMMEd().format(date);
                      print(DateFormat.yMMMEd().format(date));
                    }
                  }),
              if (isUpdateProcess)
                ElevatedButton(
                  onPressed: updateFunction,
                  child: const Text("Update"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
