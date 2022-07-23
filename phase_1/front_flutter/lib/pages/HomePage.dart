import 'package:flutter/material.dart';
import 'package:front_flutter/widgets/WalletButton.dart';



class HomePage  extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Text('Hello World'),
        ),
      floatingActionButton: WalletButton(),
    );
  }
}