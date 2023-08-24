import 'dart:async';

import 'package:firstapi/model/second.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../model/class.dart';
import '../repository/rep.dart';
import '../repository/second.dart';

class SecCon extends ControllerMVC {
  GetApi? sec = GetApi();

  GlobalKey<ScaffoldState>? scaffoldKey;

  Future secList() async {
    sec = await Sec().second();
    print('asndsabdikb');
    print(sec?.data?.length);
    setState(() {});
  }
}
