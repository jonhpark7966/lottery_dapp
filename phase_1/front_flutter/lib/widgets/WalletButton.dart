import 'package:flutter/material.dart';
import 'package:front_flutter/Web3/Wallet.dart';

class WalletButton extends StatefulWidget{
  const WalletButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WalletButtonState();
}

class WalletButtonState extends State<WalletButton>{
  Wallet wallet = Wallet();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(!wallet.isConnected){
      return FloatingActionButton.extended(
        label: const Text("Connect"),
        icon: const Icon(Icons.account_balance_wallet_outlined),
        onPressed: () async {
          await wallet.init();
          setState(() {});
          return;
          },
      );
    }else{
      return FloatingActionButton.extended(
        label: Text(wallet.currentAddress.toString().substring(0, 6) + "..."),
        icon: const Icon(Icons.account_balance_wallet),
        onPressed: () {
        // TODO.
          return;
      },);
    }
  }
}