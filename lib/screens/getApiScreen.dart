import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../controller/controller.dart';
import '../model/second.dart';

class GetApiScreen extends StatefulWidget {
  const GetApiScreen({super.key});

  @override
  _GetApiScreenState createState() => _GetApiScreenState();
}

class _GetApiScreenState extends StateMVC<GetApiScreen> {
  late FirstCon _con;

  _GetApiScreenState() : super(FirstCon()) {
    _con = controller as FirstCon;
  }

  @override
  void initState() {
    setData();
    super.initState();
  }
  void setData() async {
    await _con.firstList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("data"),
            Expanded(
              child: ListView.builder(
                itemCount: _con.getAct?.data?.length,
                itemBuilder: (context, index) {
                  Datum? data = _con.getAct?.data?.elementAt(index);
                  Column(
                    children: [
                      Text(_con.getAct?.data?.elementAt(index).id.toString() ?? "SS"),
                      Text(_con.getAct?.data?.elementAt(index).name ?? "FFF"),
                      Text(_con.getAct?.data?.elementAt(index).description ?? ""),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          _con.getAct?.data?.elementAt(index).image ?? "",
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          _con.getAct?.data?.elementAt(index).images ?? "",
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  );
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
