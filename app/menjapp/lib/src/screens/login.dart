import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menjapp/src/screens/student_profile.dart';
import 'package:menjapp/src/screens/tester_detail.dart';
import 'package:menjapp/src/screens/user_tester_list.dart';

class LogIn extends StatelessWidget{

  static const routeName = "LogIn";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width:width,
                height: height*0.35,
                child: SizedBox(height: 2,),
              ),


              Text('LogIn',
                style: TextStyle(fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        ),
              ),

              SizedBox(height: 30.0,),


              TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  suffixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),

                  
                ),
              ),

              SizedBox(height: 20.0,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0) ),
                )

                ,),

                SizedBox(
                  height:30,
                ),

                RaisedButton(
                  child: Text('Login',
                          style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xffEE7B23),
                  onPressed: (){
                    Navigator.of(context).pushNamed( StudentProfile.routeName);
                  },
                ),






            ],)
           ,)
      )
      );

      
    
  }
}