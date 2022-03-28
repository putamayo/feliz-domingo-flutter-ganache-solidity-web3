import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class TodoListModel extends ChangeNotifier {
  List<Task> todos = [];
  final String _rpcUrl = "http://192.168.2.6:7545";
  final String _wsUrl = "ws://192.168.2.6:7545/";

  final String _privateKey =
      "7af2a1469558cb434c16c6348d570591181e83b9d5d8a83974d98195d9e34423";

  late Credentials _credentials;
  late Web3Client _client;
  var _abiGetAbiPart;
  late EthereumAddress _contractAddress;

  TodoListModel() {
    initiateSetup();
  }

  initiateSetup() async {
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });
    getAbi();
  }

  Future<void> getAbi() async {
    String abiStringFile = await rootBundle.loadString("src/abis/TodoList.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abiGetAbiPart = jsonAbi["abi"];
    _contractAddress = EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);

    print(_contractAddress);

    print(abiStringFile);
  }

  getCredentials() async {
    _credentials = await EthPrivateKey.fromHex(_privateKey); //_client.credentialsFromPrivateKey(_privateKey);
  }

}

class Task {
  String taskName;
  bool isCompleted;

  Task({required this.taskName, required this.isCompleted});
}
