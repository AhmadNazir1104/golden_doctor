import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'error_handling.dart';

class ApiBaseHelper {
  final String _baseUrl = 'https://outfitterspk.myshopify.com/api/2023-04/graphql';
  final headers = {
    'X-Shopify-Storefront-Access-Token': '661d092e6652cc3554a719370241dcb5',
    'Content-Type': 'application/json'
  };
  Future<dynamic> get({required String url}) async {
    dynamic responseJson;
    try {
      // final response = await http.get(_baseUrl + url);
      Dio dio = Dio();
      final response = await dio.get(_baseUrl + url);
      responseJson = _returnResponse(response.data);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post({required String url, dynamic data}) async {
    dynamic responseJson;
    try {
      var request = http.Request('POST', Uri.parse(_baseUrl + url));
      request.body = data;

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      // Dio dio = Dio();
      // dio.interceptors.add(InterceptorsWrapper(
      //   onRequest: (options, handler) {
      //     options.headers = headers;
      //   },
      // ));
      // final response = await dio.post(
      //   _baseUrl + url,
      //   data: data,
      //   // options: Options(headers: headers),
      // );
      // print("object" + response.statusCode.toString());
      responseJson = _returnResponse(response);
      final responsebody = await response.stream.bytesToString();
      Map<String, dynamic> jsonMap = json.decode(responsebody);
      responseJson = jsonMap;
    } on SocketException {
      throw FetchDataException('Check Your Internet Connection');
    }
    return responseJson;
  }

  Future<dynamic> update({required String url, dynamic data}) async {
    dynamic responseJson;
    try {
      // final response = await http.get(_baseUrl + url);
      Dio dio = Dio();
      final response = await dio.put(_baseUrl + url, data: data);
      responseJson = _returnResponse(response.data);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url, dynamic data) async {
    dynamic responseJson;
    try {
      // final response = await http.get(_baseUrl + url);
      Dio dio = Dio();
      final response = await dio.delete(_baseUrl + url, data: data);
      responseJson = _returnResponse(response.data);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // dynamic _returnResponse(HttpResponse response) {
  dynamic _returnResponse(http.StreamedResponse response) {
    switch (response.statusCode) {
      case 200:
        // dynamic responseJson = json.decode(response.body.toString());
        return response;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
