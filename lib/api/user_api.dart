import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:nrental/api/http_services.dart';
import 'package:nrental/response/login_response.dart';
import 'package:nrental/utils/url.dart';

import '../model/user.dart';

class UserApi {
  Future<bool> registerUser(User user) async {
    bool isRegister = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        return isRegister = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isRegister;
  }

  Future<bool> loginUser(String username, String password) async {
    bool isLogin = false;
    Response response;
    var url = baseUrl + loginUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio
          .post(url, data: {"username": username, "password": password});
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;
        isLogin = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }
}
