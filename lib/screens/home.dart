// import 'package:firstapi/screens/getApiScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:mvc_pattern/mvc_pattern.dart';
//
// import '../controller/controller.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends StateMVC<MyHomePage> {
//   late FirstCon _con;
//
//   _MyHomePageState() : super(FirstCon()) {
//     _con = controller as FirstCon;
//   }
//   @override
//   void initState() {
//     setData();
//     print('JYO');
//
//     super.initState();
//   }
//   void setData() async {
//     await _con.firstList();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//       children: [
//         InkWell(
//           onTap:(){
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const GetApiScreen()),
//             );
//     },
//             child: const Text("data")),
//         Expanded(
//           child: ListView.builder(
//               itemCount: _con.getAct?.data?.length,
//               itemBuilder: (context, index) {
//                 return Text(_con.getAct?.data?.elementAt(index).employeeName ??
//                     "nbvjaskjasnk");
//               }),
//         ),
//       ],
//     ));
//   }
// }
