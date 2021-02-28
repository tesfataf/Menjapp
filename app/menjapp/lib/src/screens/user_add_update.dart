import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:menjapp/src/blocs/user_bloc.dart';
import 'package:menjapp/src/blocs/user_event.dart';
import 'package:menjapp/src/models/user_model.dart';
import 'package:menjapp/src/screens/user_route.dart';
import 'package:menjapp/src/screens/user_tester_list.dart';

class AddUpdateUser extends StatefulWidget {
  static const routeName = 'userAddUpdate';
  final UserArgument args;

  AddUpdateUser({this.args});
  @override
  _AddUpdateUserState createState() => _AddUpdateUserState();
}

class _AddUpdateUserState extends State<AddUpdateUser> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> user = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit User" : "Add New User"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.firstname : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter FirstName';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'First Name'),
                  onSaved: (value) {
                    setState(() {
                      this.user["firstname"] = value;
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.user.lastname : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Last Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Last Name'),
                  onSaved: (value) {
                    this.user["lastname"] = value;
                  }),
              TextFormField(
                  initialValue: widget.args.edit
                      ? widget.args.user.username
                      : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'UserName'),
                  onSaved: (value) {
                    setState(() {
                      this.user["username"] = value;
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.user.password : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Password'),
                  onSaved: (value) {
                    setState(() {
                      this.user["password"] = value;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                       final UserEvent event = 
                       widget.args.edit
                          ? UserUpdate(
                              UserModel(
                                id: widget.args.user.id,
                                firstname: this.user["firstname"],
                                lastname: this.user["lastname"],
                                username: this.user["username"],
                                password: this.user["password"],
                              ),
                            )
                          :
                       UserCreate(
                              UserModel(
                                id: 4,
                                firstname: this.user["firstname"],
                                lastname: this.user["lastname"],
                                username: this.user["username"],
                                password: this.user["password"],
                                profilepic: 'nopro',
                                role: 'student'
                              ),
                            );
                      BlocProvider.of<UserBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          UserTesterList.routeName, (route) => false);
                    }
                  },
                  label: Text('SAVE'),
                  icon: Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
