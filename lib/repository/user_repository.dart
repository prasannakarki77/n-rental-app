import 'package:nrental/api/user_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserApi().registerUser(user);
  }

  Future<bool> loginUser(String username, String password) {
    return UserApi().loginUser(username, password);
  }

  getDataFromSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}
