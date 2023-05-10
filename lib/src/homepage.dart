import 'dart:convert';

import 'package:dart_to_jsongenerator/src/services.dart';
import 'package:dart_to_jsongenerator/src/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'settings/settings_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.settingsController});
  final SettingsController settingsController;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController jsonController = TextEditingController();
    final TextEditingController dartController = TextEditingController();
    final TextEditingController titleController = TextEditingController();
    bool isValidJson(jsonString) {
      var decodeSucceeded = false;
      try {
        var decodedJSON = json.decode(jsonString) as Map<String, dynamic>;
        decodeSucceeded = true;
      } on FormatException {
        decodeSucceeded = false;
        print('The provided string is not valid JSON');
      }
      print('Decoding succeeded: $decodeSucceeded');
      return decodeSucceeded;
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SettingsView(controller: settingsController);
                  },
                ));
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
        title: const Text("Json To Dart Convertor"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Paste Your json Here"),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      width: size.width / 2,
                      height: size.height / 1.5,
                      child: Column(
                        children: [
                          TextField(
                              maxLines: 1,
                              controller: titleController,
                              maxLength: 100,
                              decoration: const InputDecoration(
                                hintText: "Enter Your Class Name",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              )),
                          Expanded(
                            child: TextFormField(
                                textAlign: TextAlign.start,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                controller: jsonController,
                                decoration: const InputDecoration(
                                  hintText: "Enter Your Json Body",
                                  counterText: '',
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (jsonController.text.isNotEmpty &&
                                  titleController.text.isNotEmpty) {
                                if (isValidJson(jsonController.text)) {
                                  var res = JsonHelper.convertJson(
                                      titleController.text,
                                      jsonController.text);
                                  if (res != null) {
                                    dartController.text = res;
                                    Logger().wtf(dartController.text);
                                  } else {
                                    Alert(
                                      context: context,
                                      type: AlertType.error,
                                      title: "Error",
                                      desc: "Something Went Wrong",
                                      buttons: [
                                        DialogButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          width: size.width / 10,
                                          child: const Text(
                                            "OK",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        )
                                      ],
                                    ).show();
                                  }
                                } else {
                                  Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title: "Error",
                                    desc: "Please Format Your Json Properly",
                                    buttons: [
                                      DialogButton(
                                        onPressed: () => Navigator.pop(context),
                                        width: size.width / 10,
                                        child: const Text(
                                          "OK",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )
                                    ],
                                  ).show();
                                }
                              } else {
                                Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "Error",
                                  desc: "please Fill All the Feild",
                                  buttons: [
                                    DialogButton(
                                      onPressed: () => Navigator.pop(context),
                                      width: size.width / 10,
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    )
                                  ],
                                ).show();
                              }
                            },
                            child: const Text("Convert To Json")),
                        ElevatedButton(
                            onPressed: () {
                              jsonController.clear();
                              titleController.clear();
                              dartController.clear();
                            },
                            child: const Text("Add New Json")),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Get You Dart Class Here"),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      width: size.width / 2,
                      height: size.height / 1.5,
                      child: TextFormField(
                          textAlign: TextAlign.start,
                          readOnly: true,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          controller: dartController,
                          decoration: const InputDecoration(
                            counterText: '',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              if (dartController.text.isNotEmpty) {
                                await Clipboard.setData(
                                    ClipboardData(text: dartController.text));
                                Alert(
                                  context: context,
                                  type: AlertType.success,
                                  title: "Copied to Clipboard",
                                  buttons: [
                                    DialogButton(
                                      onPressed: () => Navigator.pop(context),
                                      width: size.width / 10,
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    )
                                  ],
                                ).show();
                              } else {
                                Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "Error",
                                  desc: "No value to copy",
                                  buttons: [
                                    DialogButton(
                                      onPressed: () => Navigator.pop(context),
                                      width: size.width / 10,
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    )
                                  ],
                                ).show();
                              }
                            },
                            child: const Text("Copy Code")),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
