import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menjapp/src/blocs/user_event.dart';
import 'package:menjapp/src/screens/user_add_update.dart';
import 'package:menjapp/src/screens/user_route.dart';
import 'package:menjapp/src/screens/user_tester_list.dart';
//import 'package:flutter_network/Tester/Tester.dart';
import 'package:menjapp/src/user.dart';

class TesterDetail extends StatelessWidget {
  static const routeName = 'TesterDetail';
  final UserModel tester;

  TesterDetail({@required this.tester});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.tester.firstname}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateUser.routeName,
              arguments: UserArgument(user: this.tester, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<UserBloc>().add(UserDelete(this.tester));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    UserTesterList.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Title: ${this.tester.firstname}'),
              subtitle: Text('ECTS: ${this.tester.lastname}'),
            ),
            Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(this.tester.username),
          ],
        ),
      ),
    );
  }
}
