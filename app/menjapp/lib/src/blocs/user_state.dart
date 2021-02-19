
import 'package:equatable/equatable.dart';
import 'package:menjapp/src/models/user_model.dart';

class UserState extends Equatable{
  const UserState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserLoading extends UserState{}

class UsersLoadSuccess extends UserState{
  final List<UserModel> users;

  UsersLoadSuccess([this.users = const []]);

  @override
  // TODO: implement props
  List<Object> get props => [users];
}

class UserOperationFailure extends UserState{}