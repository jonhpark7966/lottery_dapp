import 'package:flutter/material.dart';
import 'package:front_flutter/widgets/TicketWidget.dart';


class TicketMachine extends StatefulWidget{
  const TicketMachine({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TicketMachineState();
}

class TicketMachineState extends State<TicketMachine>{

  var currentNumber = [1,10,1,1,1];

  Widget getCurrentNumberWidget(currentNumber){
    var buttons = <Widget>[];
    for(var i = 0; i < currentNumber.length; ++i){
      buttons.add(
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
                padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                shape:CircleBorder(),
                textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                )),
            child: Text(currentNumber[i].toString()),
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
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text('Choose Your Own Number!!'),
              subtitle: getCurrentNumberWidget(currentNumber),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Get Random'),
                  onPressed: () {/* ... */},
                ),
               const SizedBox(width: 8),
                TextButton(
                  child: const Text('Buy Ticket'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
            Divider(),
            Text("Tickets Already bought"),
          ],
        ),),);
  }
}
