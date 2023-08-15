import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../controller/controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends StateMVC<MyHomePage> {
  late Controller _con;

  _MyHomePageState() : super(Controller()) {
    _con = controller as Controller;
  }
  @override
  void initState() {
    setData();
    print('JYO');

    super.initState();
  }
  void setData() async {
    await _con.firstList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Text("data"),
        Expanded(
          child: ListView.builder(
              itemCount: _con.getAct?.data?.length,
              itemBuilder: (context, index) {
                print(_con.getAct?.data?.elementAt(index).employeeName);
                return Text(_con.getAct?.data?.elementAt(index).employeeName ??
                    "nbvjaskjasnk");
              }),
        ),
      ],
    ));
  }
}
