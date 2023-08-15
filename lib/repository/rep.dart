import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../helpers/endpoints.dart';
import '../model/class.dart';

class Rep {
  Future<Cars?> first() async {
    const path = ApiEndPoints.first;

    Uri uri = Uri.parse(path);
    try {
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
      final response = await http.post(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['statusCode'] == 200) {
          print(data);
          return Cars.fromJson(data);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
