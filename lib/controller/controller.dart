import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../model/class.dart';
import '../repository/rep.dart';

class Controller extends ControllerMVC {
  Cars? getAct = Cars();




  GlobalKey<ScaffoldState>? scaffoldKey;

  Future firstList() async {
    getAct = await Rep().first();

    setState(() {});
  }
}
