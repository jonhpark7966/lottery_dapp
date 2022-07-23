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

  init() async {
    if (Ethereum.isSupported) {
      await connectProvider();

      ethereum!.onAccountsChanged((accs) {
      });

      ethereum!.onChainChanged((chain) {
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
