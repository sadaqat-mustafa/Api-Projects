import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> getMethodWithoutModel() async {
    try {
      Uri url = Uri.parse("https://jsonplaceholder.typicode.com/users");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final model = jsonDecode(response.body);
        return model;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
