import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menjapp/src/blocs/user_bloc.dart';
import 'package:menjapp/src/blocs/user_state.dart';
import 'package:menjapp/src/screens/tester_detail.dart';
import 'package:menjapp/src/screens/user_add_update.dart';
import 'package:menjapp/src/screens/user_route.dart';


class UserTesterList extends StatelessWidget {
  static const routeName = 'userTesterList';
     String asstpath = "assets/images/temp.png";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: 
      Scaffold(
      appBar: AppBar(
        bottom: TabBar(tabs: [
          Tab(text: 'Testers',),
          Tab(icon: Icon(Icons.verified_user,),text: 'Students',),
          Tab(text: 'Requests',)

        ]),



        title: Text('Admin', ),
      ),
      body: TabBarView(children: [
    
       BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if (state is UserOperationFailure) {
            return Text('Could not do user operation');
          }

          if (state is UsersLoadSuccess) {
            final users = state.users;
          //  print('theusers -------- $users');

            return 
            // ListView.builder(
            //   itemCount: users.length,
            //   itemBuilder: (_, idx) => ListTile(
            //     title: Text('${users[idx].firstname} ${users[idx].lastname}'),
            //     subtitle: Text('${users[idx].username}'),
            //     onTap: () => Navigator.of(context)
            //         .pushNamed(TesterDetail.routeName, arguments: users[idx]),
            //   ),//come and fix addupdate user
            // );



              ListView.builder(
                itemCount: users.length,
                
                
                itemBuilder: (BuildContext context, int idx){
                  

                  
                  return GestureDetector(
                    child:
                   Container(
                    
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 20),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    
                    
                    children: [
                      Row(children: [
                      CircleAvatar(
                        radius: 32.0,
                        backgroundImage: AssetImage(asstpath) ,
                        ),
                        SizedBox(width:10),
                        Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                      Text(
                        '${users[idx].firstname} ${users[idx].lastname}'
                        ),
                      Text('${users[idx].username}',
                          style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 200,
                      )
                          ]),

                          ],),

                          RaisedButton(onPressed: null,
                          
                           
                           child: Text("Delete"),
                           color: Colors.red,
                          
                           ),

                    

                    ]
                    ),
                  )
                  );
                }
              );










          }

          return CircularProgressIndicator();
        },
      ),
      


      Text("heyyyy"),
      Text('yo what sap')


      ]
      ),

      floatingActionButton: 
      FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AddUpdateUser.routeName,
          arguments: UserArgument(edit: false),
        ),
        child: Icon(Icons.add),
        focusColor: Colors.amber,
      ),
    )
    );
  }
}




