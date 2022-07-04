import 'package:flutter_test/flutter_test.dart';
import 'package:nrental/repository/vehicle_repository.dart';
import 'package:nrental/response/vehicle_response.dart';

void main() {
  late VehicleRepository vehicleRepository;

  setUp(() {
    vehicleRepository = VehicleRepository();
  });
  test("Vehicle Get", () async {
    bool expectedResult = true;
    bool actualResult = false;
    VehicleResponse? vehicleRes = await vehicleRepository.getVehicles();
    if (vehicleRes != null) actualResult = vehicleRes.success!;
    expect(expectedResult, actualResult);
  });

}
