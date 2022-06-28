import 'package:flutter_test/flutter_test.dart';
import 'package:nrental/model/user.dart';
import 'package:nrental/repository/user_repository.dart';

void main() {
  late UserRepository? userRepository;
  

  setUp(() {
    userRepository = UserRepository();
  });

  group("Register Login", () {
    test("user registration", () async {
      bool expectedResult = true;
      User user = User(
        email: "prk.karki@gmail.com",
        username: "admin",
        password: "admin",
        phone: "234234324",
      );
      bool actualResult = await UserRepository().registerUser(user);
      expect(expectedResult, actualResult);
    });
    test("user login", () async {
      bool expectedResult = true;
      String username = "admin";
      String password = "admin";
      bool actualResult = await UserRepository().loginUser(username, password);
      expect(expectedResult, actualResult);
    });
  });

  setUp(() {
    userRepository = null;
  });
}
