import 'package:dart_to_jsongenerator/src/settings/settings_view.dart';
import 'package:flutter/material.dart';

import 'settings/settings_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.settingsController});
  final SettingsController settingsController;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController jsonController = TextEditingController();
    final TextEditingController dartController = TextEditingController();
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
                      child: TextFormField(
                          textAlign: TextAlign.start,
                          style: const TextStyle(color: Colors.white),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          controller: jsonController,
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
                            onPressed: () {},
                            child: const Text("Convert To Json")),
                        ElevatedButton(
                            onPressed: () {},
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
                          style: const TextStyle(color: Colors.white),
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
                            onPressed: () {}, child: const Text("Copy Code")),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text("Download File")),
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
