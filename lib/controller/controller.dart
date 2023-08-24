import 'dart:async';

import 'package:firstapi/model/second.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../repository/rep.dart';

class FirstCon extends ControllerMVC {
  GetApi? getAct = GetApi();
  GlobalKey<ScaffoldState>? scaffoldKey;

  Future firstList() async {
    getAct = await Rep().first();
    print('////////////////////////////////');
    setState(() {});
  }
}
