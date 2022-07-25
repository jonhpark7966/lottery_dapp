import 'package:flutter/material.dart';

class CurrentContractStatus extends StatefulWidget{
  const CurrentContractStatus({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CurrentContractStatusState();
}

class CurrentContractStatusState extends State<CurrentContractStatus>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("Prize \$XXXX (GET FROM CONTACT)");

}
}
