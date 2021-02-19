import 'dart:async';
import 'user_api_provider.dart';
import '../models/user_model.dart';

class Repository {
  final userApiProvider = UserApiProvider();

  Future<UserModel> fetchAllUsers() => userApiProvider.fetchUserList();
}