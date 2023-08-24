import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../helpers/endpoints.dart';
import '../model/second.dart';

class Sec {
  Future<GetApi> second() async {
    const path = ApiEndPoints.second;
    Uri uri = Uri.parse(path);
    try {
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
      final response = await http.post(
        uri,
        headers: headers,
      );

      print("data");
      print('');
      final data = json.decode(response.body);
      print(response.body);
      // print(data);
      return GetApi.fromJson(data);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
