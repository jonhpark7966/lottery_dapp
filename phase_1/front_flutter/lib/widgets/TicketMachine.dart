import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:front_flutter/widgets/TicketWidget.dart';
import 'package:numberpicker/numberpicker.dart';

import 'dart:math';


class TicketMachine extends StatefulWidget{
  const TicketMachine({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TicketMachineState();
}

class TicketMachineState extends State<TicketMachine>{

  // TODO, get from web3.
  var currentNumberLimit = 2;
  var numberOfNumbers = 5;

  var currentNumber = <int>[];
  var numberOfTicketsToBuy = 1;
  bool updateRandom = false;

  _getRandom(){
    var ret = <int>[];
    for(int i = 0; i < numberOfNumbers; ++i){
      ret.add(Random().nextInt(currentNumberLimit));
    }
    return ret;
  }

  Widget getNumberPicker(){
    return Column(
      children: <Widget>[
        NumberPicker(
          value: numberOfTicketsToBuy,
          minValue: 0,
          maxValue: 100,
          step: 1,
          haptics: true,
          itemWidth: 50,
          onChanged: (value) => setState(() => numberOfTicketsToBuy = value),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.purpleAccent.shade100),
          ),
        ),
       ]);
  }

  Widget getCurrentNumberWidget(currentNumber){
    var buttons = <Widget>[];
    for (var i = 0; i < currentNumber.length; ++i) {
      buttons.add(ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey,
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            shape: const CircleBorder(),
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        child: AnimatedTextKit(
          key: ValueKey<bool>(updateRandom),
          pause:const Duration(milliseconds: 500),
          totalRepeatCount: 2,
          isRepeatingAnimation: true,
          animatedTexts: [
            WavyAnimatedText(currentNumber[i].toString()),
          ],
        ),
        onPressed: () {
          //TODO, popup select number.
        },
      ));
    }

    return Center(
        child: FlutterTicketWidget(
      300.0,
      60.0,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buttons,
              ),
              isCornerRounded: true,
              color: Colors.white24,
            ));
  }

  @override
  void initState() {
    currentNumber = _getRandom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height:30),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                getCurrentNumberWidget(currentNumber),
                const SizedBox(width:10),
                const Text("   x ",
                 style: TextStyle(fontSize:20, fontWeight: FontWeight.bold, color:Colors.purpleAccent)),
                getNumberPicker(),
                ])
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Get Random'),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold,),
                      primary: Colors.deepPurple.shade200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    setState(() {
                      currentNumber = _getRandom();
                      updateRandom = !updateRandom;
                    });
                  },
                ),
               const SizedBox(width: 8),
                ElevatedButton(
                  child: const Text('Buy Ticket'),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold,),
                      primary: Colors.deepPurple.shade200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    //TODO, buy ticket.
                  },),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height:20),
          ],
        ),),);
  }
}
