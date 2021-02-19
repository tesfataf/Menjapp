import 'package:equatable/equatable.dart';
import 'package:menjapp/src/models/user_model.dart';

abstract class UserEvent extends Equatable{
  const UserEvent();
}

class UserLoad extends UserEvent{
  const UserLoad();

  @override
  // TODO: implement props
  List<Object> get props => [];

}

class UserCreate extends UserEvent{
  final UserModel user;
  const UserCreate(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user];
  @override
  String toString() => 'User Created {user: $user}';
  
}

class UserUpdate extends UserEvent {
  final UserModel user;

  const UserUpdate(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Updated {user: $user}';
}

class UserDelete extends UserEvent {
  final UserModel user;

  const UserDelete(this.user);

  @override
  List<Object> get props => [user];

  @override
  toString() => 'User Deleted {user: $user}';
}