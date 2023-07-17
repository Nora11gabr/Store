import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String URL, @required String? token}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({'Authorization': 'Bearer$token'});
    }
    http.Response response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'There is a problem with status code${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String URL,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({'Authorization': 'Bearer$token'});
    }
    http.Response response =
        await http.post(Uri.parse(URL), body: body, headers: header);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'There is a problem with status code ${response.statusCode} and body ${response.body}');
    }
  }

  Future<dynamic> put(
      {required String URL,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> header = {};
    header.addAll({'Content-Type': 'application/x-www-form-urlencoded '});
    if (token != null) {
      header.addAll({'Authorization': 'Bearer$token'});
    }
    http.Response response =
        await http.put(Uri.parse(URL), body: body, headers: header);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'There is a problem with status code ${response.statusCode} and body ${response.body}');
    }
  }
}
