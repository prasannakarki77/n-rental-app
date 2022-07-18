import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:nrental/api/http_services.dart';
import 'package:nrental/response/login_response.dart';
import 'package:nrental/response/user_response.dart';
import 'package:nrental/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

      if (response.statusCode == 201) {
        return isRegister = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isRegister;
  }

  Future<bool> loginUser(String username, String password) async {
    bool isLogin = false;
    String? token;
    Response response;
    var url = baseUrl + loginUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio
          .post(url, data: {"username": username, "password": password});
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;
        _setDataToSharedPref(token!);

        if (token == '') {
          isLogin = false;
        } else {
          isLogin = true;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<UserResponse?> getUserData() async {
    Future.delayed(const Duration(seconds: 2), () {});
    UserResponse? userResponse;

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString("token");
      String? token = prefs.getString("token");
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(getUserUrl,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          }));
      if (response.statusCode == 201) {
        userResponse = UserResponse.fromJson(response.data);
      } else {
        userResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }

    return userResponse;
  }

  Future<bool> updateProfile(User user) async {
    bool isUpdated = false;
    Response response;
    var dio = HttpServices().getDioInstance();
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString("token");
      String? token = prefs.getString("token");
      response = await dio.put(updateProfileUrl,
          data: user.toJson(),
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          }));

      if (response.statusCode == 201) {
        return isUpdated = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isUpdated;
  }

  Future<bool> updatePassword(Map<String, dynamic> password) async {
    bool isUpdated = false;
    Response response;
    var dio = HttpServices().getDioInstance();
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString("token");
      String? token = prefs.getString("token");

      response = await dio.put(updatePasswordUrl,
          data: jsonEncode(password),
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          }));

      if (response.statusCode == 201) {
        return isUpdated = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isUpdated;
  }

  Future<bool> updateProfileImage(User user) async {
    bool isUpdated = false;
    Response response;
    var dio = HttpServices().getDioInstance();
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString("token");
      String? token = prefs.getString("token");
      response = await dio.put(updateProfileUrl,
          data: user.toJson(),
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          }));

      if (response.statusCode == 201) {
        return isUpdated = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isUpdated;
  }
}

_setDataToSharedPref(String token) async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  } catch (e) {
    debugPrint(e.toString());
  }
}

// _getDataFromSharedPref() async {
//   // final SharedPreferences prefs = await SharedPreferences.getInstance();
//   // String? token = prefs.getString("token");
//   // print(token);
//   // return token;

//   try {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.getString("token");
//     String? token = prefs.getString("token");
//     return token;
//   } catch (e) {
//     debugPrint(e.toString());
//   }
// }
