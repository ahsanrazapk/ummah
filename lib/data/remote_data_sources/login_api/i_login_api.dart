import 'package:ummah/data/models/login_response.dart';

abstract class ILoginApi {
  Future<LoginResponse> login(Map<String, dynamic> map);
}