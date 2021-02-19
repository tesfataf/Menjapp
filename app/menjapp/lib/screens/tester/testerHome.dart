import 'package:flutter/material.dart';
import 'package:menjapp/widgets/category_selector.dart';
import 'package:menjapp/widgets/requests.dart';

class TesterHome extends StatefulWidget {
  @override
  _TesterHomeState createState() => _TesterHomeState();
}

class _TesterHomeState extends State<TesterHome> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30,
          color: Colors.white,
          onPressed: (){},
          ),
        title: Text(
          "Tester",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        //actions: [],
        
      ),
      body: Column(
        children: [
          CategorySelector(),
          Expanded(child: 
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),

              )
            ),

            child: Column(
              children: [
                Requests(),


                 ],),
          )

          ),

        ]
      )
    );
  }
}
