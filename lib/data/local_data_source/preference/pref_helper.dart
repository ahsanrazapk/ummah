import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ummah/data/local_data_source/preference/i_pref_helper.dart';
import 'package:ummah/data/models/login_response.dart';

class PrefHelper implements IPrefHelper {
  late final SharedPreferences _pref;

  PrefHelper(SharedPreferences preferences) : _pref = preferences;

  @override
  String? retrieveToken() {
    if (_pref.containsKey("userToken")) {
      return _pref.getString("userToken");
    } else {
      return null;
    }
  }

  @override
  void saveToken(value) {
    _pref.setString("userToken", value);
  }

  @override
  void clear() {
    _pref.clear();
  }

  @override
  SharedPreferences get() {
    return _pref;
  }

  @override
  void removeToken() {
    _pref.remove('userToken');
  }

  @override
  void removeUser() {
    _pref.remove('user_data');
  }

  @override
  LoginResponse? retrieveUser() {
    if (_pref.containsKey("user_data")) {
      Map<String, dynamic> _json = json.decode(_pref.getString("user_data")!);
      return LoginResponse.fromJson(_json);
    } else {
      return null;
    }
  }

  @override
  void saveUser(res) {
    _pref.setString("user_data", json.encode(res.toJson()));
  }
}
