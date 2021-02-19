import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menjapp/src/blocs/user_bloc.dart';
import 'package:menjapp/src/blocs/user_state.dart';
import 'package:menjapp/src/screens/user_add_update.dart';
import 'package:menjapp/src/screens/user_route.dart';


class UserTesterList extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testers'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if (state is UserOperationFailure) {
            return Text('Could not do user operation');
          }

          if (state is UsersLoadSuccess) {
            final users = state.users;

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, idx) => ListTile(
                title: Text('${users[idx].firstname} ${users[idx].lastname}'),
                subtitle: Text('${users[idx].username}'),
                onTap: () => Navigator.of(context)
                    .pushNamed(AddUpdateUser.routeName, arguments: users[idx]),
              ),//come and fix addupdate user
            );
          }

          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AddUpdateUser.routeName,
          arguments: UserArgument(edit: false),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
