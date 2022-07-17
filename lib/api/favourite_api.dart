import 'dart:io';
import 'package:dio/dio.dart';
import 'package:nrental/api/http_services.dart';
import 'package:nrental/response/favourite_response.dart';
import 'package:nrental/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteApi {
  Future<bool> addFavourite(vehicleId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString("token");
      String? token = prefs.getString("token");
      var dio = HttpServices().getDioInstance();
      var response = await dio.post(favouriteUrl + vehicleId,
          data: {},
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          }));
      print(response);
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      throw Exception(e);
    }
    return false;
  }

  Future<FavouriteResponse?> getFavourite() async {
    Future.delayed(const Duration(seconds: 2), () {});
    FavouriteResponse? favouriteResponse;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString("token");
      String? token = prefs.getString("token");
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(getFavouriteUrl,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          }));
      print(response);

      if (response.statusCode == 201) {
        favouriteResponse = FavouriteResponse.fromJson(response.data);
        print(favouriteResponse.data);
      } else {
        favouriteResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    return favouriteResponse;
  }

  Future<bool> deleteFavourite(favouriteId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString("token");
      String? token = prefs.getString("token");
      var dio = HttpServices().getDioInstance();
      var response = await dio.delete(deleteFavouriteUrl + favouriteId,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          }));
      print(response);
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      throw Exception(e);
    }
    return false;
  }
}
