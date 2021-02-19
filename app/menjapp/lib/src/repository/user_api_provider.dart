import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/user_model.dart';

class UserApiProvider {
  Client client = Client();

  List<UserModel> users;
  

  Future<UserModel> fetchUserList() async {
    print("entered");
    final response = await client
        .get("http://192.168.43.42:8181/v1/users");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return UserModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}