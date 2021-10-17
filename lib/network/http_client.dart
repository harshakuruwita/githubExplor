import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:github_explore/network/api_exceptions.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;

  Future<dynamic> postRequst(
      String url, dynamic body, Map<String, String>? headers) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      final response =
          await http.post(Uri.parse(url), body: body, headers: headers);

      responseJson = json.decode(response.body.toString());
    } catch (e) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> putRequst(
      String url, dynamic body, Map<String, String>? headers) async {
    var responseJson;
    try {
      var jsonData = json.encode(body);
      final response =
          await http.put(Uri.parse(url), body: jsonData, headers: headers);

      responseJson = json.decode(response.body.toString());
    } catch (e) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getRequst(String url, Map<String, String>? headers) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      responseJson = json.decode(response.body.toString());
    } catch (e) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> uploadFile(
      String url, Map<String, String>? headers, File file) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;

    try {
      var requst = http.MultipartRequest("POST", Uri.parse(url));
      requst.headers.addAll(headers!);
      requst.files
          .add(await http.MultipartFile.fromPath('uploadedFiles', file.path));

      final response = await requst.send();
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      responseJson = json.decode(responseString);
    } catch (e) {
      print(e);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
