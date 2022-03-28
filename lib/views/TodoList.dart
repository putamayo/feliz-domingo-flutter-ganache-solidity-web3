import 'package:feliz_domingo/models/TodoListModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var list = Provider.of<TodoListModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Web3Dart para todos :)"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) =>
                  ListTile(
                    title: Text("ToDo item #"),
                  ),
            ),
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(),
                    flex: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("ADD"),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}