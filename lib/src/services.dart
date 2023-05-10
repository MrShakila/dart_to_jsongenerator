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
}
