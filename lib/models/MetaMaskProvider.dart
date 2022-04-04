import 'package:flutter/cupertino.dart';
import 'package:web3dart/browser.dart';
import 'package:web3dart/web3dart.dart';

class MetaMaskProvider extends ChangeNotifier {
  static const operatingChain = 4;
  String currentAddress = "";
  int currentChain = -1;
  bool get isEnabled => Ethereum() != null;
  bool get isInOperatingChain => currentAddress.isNotEmpty;
}