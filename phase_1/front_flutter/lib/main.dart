import 'dart:io';

import 'package:flutter/material.dart';
import 'package:front_flutter/abi.dart';

import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lottery',
      theme: ThemeData(
       primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    var apiUrl = "https://goerli.infura.io/v3/02b229d0df7446198f3af12cfc78a617";
    var wsUrl = "wss://mainnet.infura.io/ws/v3/02b229d0df7446198f3af12cfc78a617";

    var httpClient = Client();
    var credentials = EthPrivateKey.fromHex("44481312c12182632b1b8bc60f31213074433eb9d20dad771ce4be580ce189da");
    File abiFile = File("/Users/jonhpark/workspace/blockchain/lottery_dapp/phase_1/solidity/artifacts/contracts/LotterPhase1.sol/LotteryPhase1.json");
    EthereumAddress contractAddr =
      EthereumAddress.fromHex('0xf451659CF5688e31a31fC3316efbcC2339A490Fb');

    var ethClient;
    var contract;

    var drawFunction;
    var buyticketFunction;
    var totalAmountFunction;

    var totalAmount = 0.0;

  @override
  void initState() {

   ethClient = Web3Client(apiUrl, Client(), socketConnector: () {
    return IOWebSocketChannel.connect(wsUrl).cast<String>();
  });
   contract =
      DeployedContract(ContractAbi.fromJson(abiCode, 'LotteryPhase1'), contractAddr);

   drawFunction = contract.function('draw');
   buyticketFunction = contract.function('buyticket');
   totalAmountFunction = contract.function('totalAmount');

 }

  _reload() async {
    totalAmount = await ethClient.call(
      contract: contract, function: totalAmountFunction, params:[]);
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$totalAmount',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
   );
  }
}
