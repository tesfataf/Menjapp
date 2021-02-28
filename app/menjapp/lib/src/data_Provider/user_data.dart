import 'dart:async';
import 'dart:async';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class UserDataProvider{
  final _baseUrl = 'http://192.168.43.42:8181';
  final http.Client httpClient;

  UserDataProvider({@required this.httpClient}) :assert(httpClient != null);

  Future<void> createUser(UserModel user) async {
    final response = await httpClient.post('$_baseUrl/users',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      
      },

      body: jsonEncode(<String, dynamic>{
        'firstname': user.firstname,
        'lastname': user.lastname,
        'username': user.username,
        'password': user.password,
        'profilepic': user.profilepic,
        'role': user.role,

      }),
    );

    print("hlooow its mehhh");
    print(response.reasonPhrase );
    print(response.statusCode );

    print(response.body);

    // if (response.statusCode == 201) {
      
    //   return UserModel.fromJson(jsonDecode(response.body));
    // }else
    
    if (response.statusCode != 201){
      throw Exception('Failed to create User.');
    }

  }

  Future<List<UserModel>> getUsers() async {
    final response = await httpClient.get('$_baseUrl/users');
    if(response.statusCode == 200){
      final users = jsonDecode(response.body) as List;
      //print(users); 
      return users.map((user) => UserModel.fromJson(user)).toList();

    }else{
      throw Exception('failed to load users');
    }

  }

  Future<void> updateUser(UserModel user) async{
    final http.Response response = await httpClient.put(
      '$_baseUrl/users/${user.id}',
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id' : user.id,
        'firstname': user.firstname,
        'lastname': user.lastname,
        'username': user.username,
        'password': user.password,
        'profilepic': user.profilepic,
        'role': user.role,
      }),
    );
    print(response.statusCode);
    print(response.reasonPhrase);
    if (response.statusCode != 200) {
      throw Exception('Failed to load user!');
    }
  } 

  Future<void> deleteUser(String id) async{
    final response = await httpClient.delete(
      '$_baseUrl/users/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );
  

    if (response.statusCode != 204){
      throw Exception('Failed to delete!');
    }

  }

  

}