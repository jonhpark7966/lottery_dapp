import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:front_flutter/widgets/CurrentContractStatus.dart';
import 'package:front_flutter/widgets/TicketMachine.dart';
import 'package:front_flutter/widgets/WalletButton.dart';



class HomePage  extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:SizedBox(
            width: kIsWeb?500.0:double.infinity,
            child: Column(
              children: const [
                SizedBox(height:30),
                Text("Title"),
                CurrentContractStatus(),
                TicketMachine(),
              ],
            ),
          ),
        ),
      floatingActionButton: WalletButton(),
    );
  }
}