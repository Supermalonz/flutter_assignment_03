import 'package:flutter/material.dart';
import 'package:flutter_assignment_03/firebase/firestore.dart';

class Add extends StatefulWidget {
  @override
  AddState createState() => AddState();
}

class AddState extends State<Add> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController fcontrol = TextEditingController();
    TextFormField txtfield = TextFormField(
      controller: fcontrol,
      decoration: InputDecoration(
        hintText: "Object",
      ),
      validator: (i) {
        if (i.isEmpty) {
          return 'Please enter something';
        }
      },
    );
    RaisedButton savebutton = RaisedButton(
      child: const Text('Save'),
      onPressed: () {
        if (_formKey.currentState.toString().length > 0) {
          FireStore.addTodo(fcontrol.text.trim());
          Navigator.pop(context);
        }
      },
    );
    
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('New Subject'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[txtfield, savebutton,]
          ),
        ),
      ),
    );
  }
}