import 'dart:convert' as convert;

import 'package:ecommerce_flutter/injection.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

@lazySingleton
class AuthRepository {
  final http.Client httpClient;

  static const BASE_URL = "https://reqres.in/api/";

  AuthRepository({this.httpClient});

  Future<String> login({
    @required String email,
    @required String password,
  }) async {
    final loginUrl = "${BASE_URL}login";
    http.Response response = await this
        .httpClient
        .post(loginUrl, body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonDecode =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonDecode['token'];
    } else {
      return null;
    }
  }

  Future<String> signup({
    @required String email,
    @required String password,
  }) async {
    final registerUrl = "${BASE_URL}register";
    http.Response response = await this
        .httpClient
        .post(registerUrl, body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonDecode =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonDecode['token'];
    } else {
      return null;
    }
  }

  logout() {
    getIt<RxSharedPreferences>().dispose();
  }
}
