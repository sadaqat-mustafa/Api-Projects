import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:integration_api/Model/get_model.dart';
import 'package:integration_api/user_model.dart';

class ApiServices {
  Future<List<CommentsModel>?> getCommentsModel() async {
    var data = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    var response = await data.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return commentsModelFromJson(json);
    }
    return null;
  }

  Future<List<UserModel>?> getUsersModel() async {
    var data = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await data.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userModelFromJson(json);
    }
    return null;
  }
}
