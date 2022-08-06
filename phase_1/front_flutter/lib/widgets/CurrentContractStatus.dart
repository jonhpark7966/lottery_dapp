import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CurrentContractStatus extends StatefulWidget {
  const CurrentContractStatus({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CurrentContractStatusState();
}

class CurrentContractStatusState extends State<CurrentContractStatus> {
  //TODO, get dollars from web3
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purpleAccent,
      Colors.blueAccent,
      Colors.yellowAccent,
      Colors.redAccent,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 50.0,
      fontFamily: 'Horizon',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("You Can Get ",
         style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
         const SizedBox(height:10.0),
        SizedBox(
          width: 250.0,
          child: Center(child:AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                '\$?,???',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
              ColorizeAnimatedText(
                '\$4,821',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              )
            ],
            isRepeatingAnimation: false,
          ),),
        ),
      ],
    );
  }
}
