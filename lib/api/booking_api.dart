import 'dart:io';
import 'package:dio/dio.dart';
import 'package:nrental/api/http_services.dart';
import 'package:nrental/model/booking.dart';
import 'package:nrental/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingAPI {
  Future<bool> addBooking(Booking booking, vehicleId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString("token");
      String? token = prefs.getString("token");
      var dio = HttpServices().getDioInstance();
      var response = await dio.post(bookingUrl + vehicleId,
          data: booking.toJson(),
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          }));
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      throw Exception(e);
    }
    return false;
  }

  // Future<BookingResponse?> getBooking() async {
  //   Future.delayed(const Duration(seconds: 2), () {});
  //   BookingResponse? bookingResponse;
  //   try {
  //     var dio = HttpServices().getDioInstance();
  //     Response response = await dio.get(get);
  //     if (response.statusCode == 201) {
  //       productResponse = ProductResponse.fromJson(response.data);
  //     } else {
  //       productResponse = null;
  //     }
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  //   return productResponse;
  // }
}


   // var formData = FormData.fromMap(
      //   {
      //     "name": "test",
      //     "description": "test",
      //     "image": image,
      //     "price": "234",
      //     "category": "6281fdb044d29546f08846d4",
      //     "countInStock": "2",
      //     "rating": "3",
      //     "numReviews": "3",
      //     "isFeatured": "false",
      //   },
      // );