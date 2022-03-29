import 'package:feliz_domingo/models/TodoListModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  TextEditingController t1 = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    var listModel = Provider.of<TodoListModel>(context);
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text("🔥 Web3dart para todos 🔥"),
      ),
      body: listModel.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    itemCount: listModel.taskCount,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(listModel.todos[index].taskName),
                    ),
                  ),
                ),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: TextField(controller: t1,),
                      flex: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          listModel.addTask(t1.text);
                          t1.clear();
                        },
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
