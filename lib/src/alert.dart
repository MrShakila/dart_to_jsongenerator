import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Utills {
  static void showErrorAlert(BuildContext context, String desc, Size size) {
    Alert(
      context: context,
      type: AlertType.error,
      desc: desc,
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          width: size.width / 10,
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  static void showSuccessAlert(BuildContext context, String title, Size size) {
    Alert(
      context: context,
      type: AlertType.success,
      title: title,
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          width: size.width / 10,
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}
