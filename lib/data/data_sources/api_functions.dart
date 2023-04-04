import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spoogle_app/data/core/api_constants.dart';

class ApiFun {
  ApiFun._();
  static var header = {
    'Accept': 'application/json',
    "Authorization": 'Bearer ${ApiConstants.bearerToken}',
  };

  static Future<dynamic> apiGet(String endpoint) async {
    http.Response response = await http.get(
      Uri.parse(ApiConstants.baseUrl + endpoint),
      headers: header
    );
    if (kDebugMode) {
      print('$endpoint Api Res ----: ${response.body}');
    }

    return jsonDecode(response.body.toString());
  }

  static Future<dynamic> apiGetRequestWithParams(String endPoint,  Map<String, String> body) async {
    Map<String,String> headerWithParams = {
      'Accept': 'application/json',
      "Authorization": 'Bearer ${ApiConstants.bearerToken}',
    };
    headerWithParams.addAll(body);
    http.Response response = await http.get(Uri.parse(ApiConstants.baseUrl + endPoint), headers: headerWithParams);
    if (kDebugMode) {}

    return jsonDecode(response.body);
  }


  static Future<dynamic> apiPostWithBody(String endpoint, Map<String, dynamic> body) async {
    http.Response response = await http.post(
      Uri.parse(ApiConstants.baseUrl + endpoint),
      headers: header,
      body: body,
    );

    if (kDebugMode) {
      print('$endpoint Api Res ----: ${response.body}');
    }
    return jsonDecode(response.body.toString());
  }

  static Future<dynamic> apiPostMultipartBody(String fileName, String fileParams, String endpoint, Map<String, String> body) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(ApiConstants.baseUrl + endpoint));
      request.headers.addAll(header);
      request.fields.addAll(body);

      if (fileParams != "text_message") {
        request.files.add(await http.MultipartFile.fromPath(fileParams, fileName));
      }

      var response = await request.send();
      var responseData = await response.stream.toBytes();
      String responseString = String.fromCharCodes(responseData);

      debugPrint('---- uploadImage Res responseString: $responseString');

      return jsonDecode(responseString);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}