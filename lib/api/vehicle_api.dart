import 'package:dio/dio.dart';

// ignore: depend_on_referenced_packages
import 'package:nrental/api/http_services.dart';
import 'package:nrental/response/vehicle_response.dart';
import 'package:nrental/utils/url.dart';

class VehicleAPI {
  Future<VehicleResponse?> getVehicles() async {
    Future.delayed(const Duration(seconds: 2), () {});
    VehicleResponse? vehicleResponse;
    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(vehicleUrl);
      if (response.statusCode == 201) {
        vehicleResponse = VehicleResponse.fromJson(response.data);
      } else {
        vehicleResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    return vehicleResponse;
  }
}
