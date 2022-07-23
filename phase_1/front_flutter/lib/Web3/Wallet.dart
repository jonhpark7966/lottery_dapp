import 'package:flutter_web3/flutter_web3.dart';



class Wallet{
   Wallet._privateConstructor();

  static const OPERATING_CHAIN = 5; // goerli
  static final Wallet _instance = Wallet._privateConstructor();

  factory Wallet(){
    return _instance;
  }

  bool get isInOperatingChain => currentChain == OPERATING_CHAIN;
  bool get isConnected => Ethereum.isSupported && currentAddress.isNotEmpty;

  String currentAddress = '';
  int currentChain = -1;

  init() {
    if (Ethereum.isSupported) {
      connectProvider();

      ethereum!.onAccountsChanged((accs) {
        clear();
      });

      ethereum!.onChainChanged((chain) {
        clear();
      });
    }
  }

  connectProvider() async {
    if (Ethereum.isSupported) {
      final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty) {
        currentAddress = accs.first;
        currentChain = await ethereum!.getChainId();
      }
    }
  }

  clear() {
    currentAddress = '';
    currentChain = -1;
  }
}
