import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class UserModel extends Equatable{
  int id;
  String firstname;
  String lastname;
  String username;
  String password;
  String profilepic;
  String role;

  UserModel({this.id, @required this.firstname,this.lastname,this.username,
              this.password, this.profilepic,this.role});

  @override
  // TODO: implement props
  List<Object> get props => [id,firstname,lastname,username,password,profilepic,role];


  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserModel(
    id: parsedJson['id'],
    firstname: parsedJson['firstname'],
    lastname: parsedJson['lastname'],
    username: parsedJson['username'],
    password: parsedJson['password'],
    profilepic: parsedJson['profilepic'],
    role: parsedJson['role'],
    );
  }
  @override
  String toString() => 'User{id: $id,firstname: $firstname,lastname: $lastname,username: $username,password: $password, profilepic: $profilepic,role: $role}';

  
 

  // String get firstname => _firstname;

  // String get lastname => _lastname;

  // String get username => _username;
  // String get password => _password;
  // String get profilepic => _profilepic;
  // String get role => _role;
}
