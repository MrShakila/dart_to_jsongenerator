import 'package:dart_to_jsongenerator/src/settings/settings_view.dart';
import 'package:flutter/material.dart';

import 'settings/settings_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.settingsController});
  final SettingsController settingsController;
  @override
  Widget build(BuildContext context) {
    final TextEditingController jsonController = TextEditingController();
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
          const Text("Paste Your json Here"),
          Expanded(
            child: TextFormField(
                textAlign: TextAlign.center,
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
                    hintText: "Paste Your Json Here",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none)),
          )
        ],
      ),
    );
  }
}
