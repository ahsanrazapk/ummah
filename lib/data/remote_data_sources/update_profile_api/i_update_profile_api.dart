import 'package:ummah/data/models/login_response.dart';


abstract class IUpdateProfileApi {
  Future<LoginResponse> updateProfile(Map<String, dynamic> map);
}