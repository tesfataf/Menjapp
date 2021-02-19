import 'package:flutter/material.dart';
import 'package:menjapp/src/models/user_model.dart';
//import 'package:menjapp/src/models//course/course.dart';
import 'package:menjapp/src/screens/user_add_update.dart';
import 'package:menjapp/src/screens/user_tester_list.dart';

class UserAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => UserTesterList());
    }

    if (settings.name == AddUpdateUser.routeName) {
      UserArgument args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => AddUpdateUser(
                args: args,
              ));
    }

    // if (settings.name == CourseDetail.routeName) {
    //   Course course = settings.arguments;
    //   return MaterialPageRoute(
    //       builder: (context) => CourseDetail(
    //             course: course,
    //           ));
    // }

    return MaterialPageRoute(builder: (context) => UserTesterList());
  }
}

class UserArgument {
  final UserModel user;
  final bool edit;
  UserArgument({this.user, this.edit});
}