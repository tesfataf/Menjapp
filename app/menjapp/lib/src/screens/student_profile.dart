import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget{
  static const routeName = 'studentProfile';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(child:  Column(
        
          children: [
            Container(
              padding: EdgeInsets.only(top:50),
              width: 400,
              
              child: Column(children: [
                CircleAvatar(
                  radius:100,
                  backgroundImage: AssetImage('assets/images/temp.png'),
                ),
                SizedBox(height:10),
                Text('Tesfa Fiker'),
                SizedBox(height:5),
                Text('@tafhope')
              ],),
            ),
            

            Container(
              padding: EdgeInsets.only(top:100),
              child: Column(children: [
                ElevatedButton(onPressed: null, child: Text('Request')),

                SizedBox(height:30),

                Text('Result'),
                Text("Test1"),
                Text("Test2"),
                Text("Test3"),
                Text("Test4"),
              ])
            ),

        ]
        ,)
        
    ));
  }
}