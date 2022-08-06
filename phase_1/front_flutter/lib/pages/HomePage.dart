import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:front_flutter/widgets/CurrentContractStatus.dart';
import 'package:front_flutter/widgets/TicketMachine.dart';
import 'package:front_flutter/widgets/TitleWidget.dart';
import 'package:front_flutter/widgets/WalletButton.dart';
import 'package:parallax_rain/parallax_rain.dart';
  



class HomePage  extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return       Scaffold(
        body: ParallaxRain(
          dropFallSpeed: 1,
          numberOfLayers: 5,
          numberOfDrops: 100,
          trail: true,
        dropColors: const [
          Colors.blueGrey
        ],
        child:
Center(
          child: SizedBox(
            width: kIsWeb ? 500.0 : double.infinity,
            child: Column(
              children: const [
                SizedBox(height: 30),
                TitleWidget(),
                CurrentContractStatus(),
                SizedBox(height: 30),
                TicketMachine(),
              ],
            ),
          ),
        ),),
        floatingActionButton: WalletButton(),
    );
  }
}