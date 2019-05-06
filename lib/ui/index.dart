import 'package:flutter/material.dart';
import 'package:flutter_assignment_03/ui/checking.dart';
import 'package:flutter_assignment_03/ui/list.dart';
import 'package:flutter_assignment_03/firebase/firestore.dart';

class ToDo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ToDoState();
  }
}

class _ToDoState extends State<ToDo> {
  int now_index = 0;

  @override
  Widget build(BuildContext context) {
    List<AppBar> allbars = <AppBar>[
      AppBar(
        title: Text('Todo'),
        centerTitle: true,
        actions: <IconButton>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
        ],
      ),
      AppBar(
        title: Text('Todo'),
        centerTitle: true,
        actions: <IconButton>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              FireStore.delAll();
            },
          ),
        ],
      ),
    ];

    final List<Widget> scene = <Widget>[
      Listing(),
      Checking(),
    ];

    return Scaffold(
      appBar: allbars[this.now_index],
      body: scene[this.now_index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          currentIndex: this.now_index,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Task'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              title: Text('Completed'),
            ),
          ],
          onTap: (int i) {
            setState(() {
              this.now_index = i;
            });
          },
        ),
      ),
    );
  }
}