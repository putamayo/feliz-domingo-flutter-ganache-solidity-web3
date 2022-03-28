import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: TodoList());
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Web3Dart ToDo app"),
    ),
    body: Column(
      children: [
        Expanded(
          flex: 4,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => ListTile(
              title: Text("ToDo item #"),
            ),
          ),
        ),
        Expanded(child: null),
      ],
    ),
  );
}
