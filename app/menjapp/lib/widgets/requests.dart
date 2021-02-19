import 'package:flutter/material.dart';
import '../src/models/user_model.dart';
import '../src/blocs/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Requests extends StatelessWidget {
   final List<String> chats = ['Aynalem',"Abebe","Rebecc",'Aynalem',"Abebe","Rebecc", 'Aynalem',"Abebe","Rebecc",'Aynalem',"Abebe","Rebecc",'Aynalem',"Abebe","Rebecc", 'Aynalem',"Abebe","Rebecc"];
   String asstpath = "assets/images/temp.png";
  @override
  Widget build(BuildContext context) {

  // bloc.fetchAllUsers();
 













    return Expanded(child: 
                Container(
                  height: 200.0,
                
                  decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),

              )
            ),

              child: ListView.builder(
                itemCount: chats.length,
                
                
                itemBuilder: (BuildContext context, int index){
                  

                  
                  return GestureDetector(
                    child:
                   Container(
                    
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 20),

                    child: Row(
                    
                    
                    
                    children: [
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage: AssetImage(asstpath) ,
                        ),
                        Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                      Text(
                        chats[index]
                        ),
                      Text(chats[index]),
                      SizedBox(
                        width: 200,
                      )
                          ]),

                          ElevatedButton(onPressed: null,
                           
                           child: Text("Delete")),

                    

                    ]
                    ),
                  ),

                  onTap: () => Navigator.pushNamed(context, '/updateTester', arguments: index),

                  );
                } ),

                )
                );

           
  }
}







//  Widget buildList(AsyncSnapshot<UserModel> snapshot) {
//     return GridView.builder(
//         itemCount: 6,
//         gridDelegate:
//             new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: (BuildContext context, int index) {
//           return null;
        
//         });
//   }


