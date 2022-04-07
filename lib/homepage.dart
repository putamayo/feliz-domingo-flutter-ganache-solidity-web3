import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _id;

  void _getInfo() async {
    // Get device id
    String? result = await PlatformDeviceId.getDeviceId;

    // Update the UI
    setState(() {
      _id = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('test device id view')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Text(
          _id ?? 'Press the button',
          style: TextStyle(fontSize: 20, color: Colors.red.shade900),
        )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _getInfo, child: const Icon(Icons.play_arrow)),
    );
  }
}
