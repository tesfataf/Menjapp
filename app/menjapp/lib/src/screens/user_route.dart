import 'package:flutter/material.dart';
import 'package:menjapp/src/models/user_model.dart';
import 'package:menjapp/src/screens/login.dart';
import 'package:menjapp/src/screens/student_profile.dart';
//import 'package:menjapp/src/models//course/course.dart';
import 'package:menjapp/src/screens/user_add_update.dart';
import 'package:menjapp/src/screens/user_tester_list.dart';
import 'package:menjapp/src/screens/tester_detail.dart';

class UserAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => LogIn());
    }

    if (settings.name == AddUpdateUser.routeName) {
      UserArgument args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => AddUpdateUser(
                args: args,
              ));
    }

    if (settings.name == TesterDetail.routeName) {
      UserModel user = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => TesterDetail(
                tester: user,
              ));
    }

    if (settings.name == UserTesterList.routeName) {
      UserModel user = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => UserTesterList());
    }

    if (settings.name == StudentProfile.routeName){
      return MaterialPageRoute(builder: (context) => StudentProfile());
    }

    return MaterialPageRoute(builder: (context) => UserTesterList());
  }
}

class UserArgument {
  final UserModel user;
  final bool edit;
  UserArgument({this.user, this.edit});
}