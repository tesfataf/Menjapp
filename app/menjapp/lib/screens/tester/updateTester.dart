import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateTester extends StatefulWidget {
  @override
  _UpdateTesterState createState() => _UpdateTesterState();
}

class _UpdateTesterState extends State<UpdateTester> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Tester'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
       //   key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue:'',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter course code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'First Name'),
                  // onSaved: (value) {
                  //   setState(() {
                  //     this._course["code"] = value;
                  //   });
                  // }
                  ),

                  TextFormField(
                  initialValue:'',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter course code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Last Name'),
                  // onSaved: (value) {
                  //   setState(() {
                  //     this._course["code"] = value;
                  //   });
                  // }
                  ),

                  TextFormField(
                  initialValue:'',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter course code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Username'),
                  // onSaved: (value) {
                  //   setState(() {
                  //     this._course["code"] = value;
                  //   });
                  // }
                  ),

                  TextFormField(
                  initialValue:'',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter course code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'password'),
                  // onSaved: (value) {
                  //   setState(() {
                  //     this._course["code"] = value;
                  //   });
                  // }
                  ),

                  TextFormField(
                  initialValue:'',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter course code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'role'),
                  // onSaved: (value) {
                  //   setState(() {
                  //     this._course["code"] = value;
                  //   });
                  // }
                  ),

                  
                ElevatedButton(onPressed: null,
                           
                           child: Text("Update"),
              
                 ) ],
          ),
        ),
      ),
    ); 
  }
}