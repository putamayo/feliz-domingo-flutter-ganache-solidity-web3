import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class TodoListModel extends ChangeNotifier {
  List<Task> todos = [];
  final String _rpcUrl = "http://192.168.2.6:7545";//
  final String _wsUrl = "ws://192.168.2.6:7545/";
  final String _privateKey =
      "7af2a1469558cb434c16c6348d570591181e83b9d5d8a83974d98195d9e34423";

  late Credentials _credentials;
  late Web3Client _client;
  var _abiGetAbiPart;
  late EthereumAddress _contractAddress;
  late EthereumAddress _myAddress;
  late DeployedContract _contract;
  late ContractFunction _taskCount;
  late ContractFunction _todos;
  late ContractFunction _createTask;
  late ContractEvent _taskCreatedEvent;

  TodoListModel() {
    initiateSetup();
  }

  Future<void> initiateSetup() async {
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });
    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async {
    String abiStringFile =
        await rootBundle.loadString("src/abis/TodoList.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abiGetAbiPart = jsonEncode(jsonAbi["abi"]);
    _contractAddress =
        EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);

  }

  Future<void> getCredentials() async {
    _credentials = await EthPrivateKey.fromHex(
        _privateKey); //_client.credentialsFromPrivateKey(_privateKey);
    _myAddress = await _credentials.extractAddress();
  }

  Future<void> getDeployedContract() async {
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiGetAbiPart.toString(), "TodoList"),
        _contractAddress);
    _taskCount = _contract.function("taskCount");
    _createTask = _contract.function("createTask");
    _todos = _contract.function("todos");
    _taskCreatedEvent = _contract.event("TaskCreated");
    getTodos();
  }

  getTodos() async {
    List totalTasksList = await _client
        .call(contract: _contract, function: _taskCount, params: []);
    BigInt totalTasks = totalTasksList[0];
    print(totalTasks);
    todos.clear();
    for (var i = 0; i < totalTasks.toInt(); i++) {
      _client.call(contract: _contract, function: _todos, params: [i]);
    }
  }
}

class Task {
  String taskName;
  bool isCompleted;

  Task({required this.taskName, required this.isCompleted});
}
