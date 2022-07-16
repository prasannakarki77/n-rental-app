import 'dart:io';
import 'package:dio/dio.dart';
import 'package:nrental/api/http_services.dart';
import 'package:nrental/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/review.dart';

class ReviewApi {
  Future<bool> addReview(Review review, vehicleId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString("token");
      String? token = prefs.getString("token");
      var dio = HttpServices().getDioInstance();
      var response = await dio.post(addReviewUrl + vehicleId,
          data: review.toJson(),
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

  // Future<BookingDetailsResponse?> getBookingDetails(bookingId) async {
  //   Future.delayed(const Duration(seconds: 2), () {});
  //   BookingDetailsResponse? bookingDetailsResponse;
  //   try {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.getString("token");
  //     String? token = prefs.getString("token");
  //     var dio = HttpServices().getDioInstance();

  //     Response response = await dio.get(getBookingDetailsUrl + bookingId,
  //         options: Options(headers: {
  //           HttpHeaders.authorizationHeader: "Bearer $token",
  //         }));
  //     print("boook res");
  //     print(response);
  //     print(response.statusCode);
  //     if (response.statusCode == 201) {
  //       bookingDetailsResponse = BookingDetailsResponse.fromJson(response.data);
  //       print("booo");
  //     } else {
  //       bookingDetailsResponse = null;
  //     }
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  //   return bookingDetailsResponse;
  // }
}
