import 'package:flutter/material.dart';
import 'package:flutter_assignment_03/ui/index.dart';
import 'package:flutter_assignment_03/ui/add_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoList',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ToDo(),
        '/add': (context) => Add(),
      },
    );
  }
}