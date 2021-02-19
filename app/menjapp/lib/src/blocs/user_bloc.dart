import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menjapp/src/blocs/user_event.dart';
import 'package:menjapp/src/blocs/user_state.dart';
import 'package:menjapp/src/repository/user_repository.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(UserLoading());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoad) {
      yield UserLoading();
      try {
        final users = await userRepository.getUsers();
        yield UsersLoadSuccess(users);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserCreate) {
      try {
        await userRepository.createUser(event.user);
        final users = await userRepository.getUsers();
        yield UsersLoadSuccess(users);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserUpdate) {
      try {
        await userRepository.updateUser(event.user);
        final users = await userRepository.getUsers();
        yield UsersLoadSuccess(users);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserDelete) {
      try {
        await userRepository.deleteUser(event.user.id);
        final users = await userRepository.getUsers();
        yield UsersLoadSuccess(users);
      } catch (_) {
        yield UserOperationFailure();
      }
    }
  }
}
