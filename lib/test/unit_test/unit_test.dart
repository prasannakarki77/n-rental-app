import 'package:flutter_test/flutter_test.dart';
import 'package:nrental/model/user.dart';
import 'package:nrental/repository/article_respository.dart';
import 'package:nrental/repository/user_repository.dart';
import 'package:nrental/repository/vehicle_repository.dart';
import 'package:nrental/response/article_response.dart';

import '../../response/vehicle_response.dart';

void main() {
  late UserRepository? userRepository;
  late VehicleRepository? vehicleRepository;
  late ArticleRepository? articleRepository;
  setUp(() {
    userRepository = UserRepository();
    vehicleRepository = VehicleRepository();
    articleRepository = ArticleRepository();
  });

  group("Register Login", () {
    test("user registration", () async {
      bool expectedResult = true;
      User user = User(
        email: "prk.karki@gmail.com",
        username: "admin11",
        password: "admin11",
        phone: "234234324",
      );
      bool actualResult = await userRepository!.registerUser(user);
      expect(expectedResult, actualResult);
    });
    test("user login", () async {
      bool expectedResult = true;
      String username = "admin11";
      String password = "admin11";
      bool actualResult = await userRepository!.loginUser(username, password);
      expect(expectedResult, actualResult);
    });
  });

  group('Vehicle API test', () async {
    test("Vehicle Get", () async {
      bool expectedResult = true;
      bool actualResult = false;
      VehicleResponse? vehicleRes = await vehicleRepository!.getVehicles();
      if (vehicleRes != null) actualResult = vehicleRes.success!;
      expect(expectedResult, actualResult);
    });
  });

  test("Vehicle Get", () async {
    bool expectedResult = true;
    bool actualResult = false;
    ArticleResponse? artticleRes = await articleRepository!.getArticles();
    if (artticleRes != null) actualResult = artticleRes.success!;
    expect(expectedResult, actualResult);
  });

  setUp(() {
    userRepository = null;
  });
}
