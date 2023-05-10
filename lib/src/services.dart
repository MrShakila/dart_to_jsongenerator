import 'dart:convert';

import 'package:json_dart_generator/json_dart_generator.dart';

class JsonHelper {
  static String? convertJson(String name, String inputJson) {
    try {
      var generator = DartCodeGenerator(rootClassName: name);
      var code = generator.generate(inputJson);
      print(code);
      return code;
    } catch (e) {
      return null;
    }
  }

  static bool isValidJson(jsonString) {
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
}
