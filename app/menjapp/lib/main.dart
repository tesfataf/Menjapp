import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menjapp/bloc_observer.dart';
import 'package:menjapp/screens/tester/testerHome.dart';
import 'package:menjapp/screens/tester/updateTester.dart';
import 'package:menjapp/src/blocs/user_event.dart';
import 'package:menjapp/src/screens/user_route.dart';
import 'package:menjapp/src/user.dart';
import 'package:http/http.dart' as http;

import 'src/repository/user_repository.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository(
    dataProvider: UserDataProvider(httpClient: http.Client(),
    ),
    );
  runApp(
    MyApp(userRepository: userRepository,)
    );
}

class MyApp extends StatelessWidget{
  final UserRepository userRepository;
  MyApp({@required this.userRepository})
      : assert(userRepository != null);




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RepositoryProvider.value(
      value: this.userRepository,
      child: BlocProvider(
        create: (context) => UserBloc(userRepository: this.userRepository)..add(UserLoad()),
        child: MaterialApp(
          title: 'MenjApp',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
             ),
             onGenerateRoute: UserAppRoute.generateRoute,
        ),
    )
    );
   
  }
}






//  return MaterialApp(

//         initialRoute: '/',
//       routes: {
//         '/': (ctx) => TesterHome(),
//         '/updateTester': (ctx) => UpdateTester(),
        
//       },




//       title: 'MenjApp',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.red,
//         accentColor: Color(0xFFFE9EB)
//       ) ,

      
//     );