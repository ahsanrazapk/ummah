
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ummah/data/models/login_response.dart';

abstract class IPrefHelper {
  String? retrieveToken();
  void saveToken(value);
  void removeToken();

  void saveUser(LoginResponse verificationModel);
  LoginResponse? retrieveUser();
  void removeUser();

  SharedPreferences get();
  void clear();




}
