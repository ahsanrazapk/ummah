import 'package:dio/dio.dart';
import 'package:ummah/application/core/exception/exception.dart';
import 'package:ummah/application/network/client/iApService.dart';
import 'package:ummah/application/network/error_handler/error_handler.dart';
import 'package:ummah/common/logger/log.dart';
import 'package:ummah/data/models/login_response.dart';

import 'i_update_profile_api.dart';

class UpdateProfileApi implements IUpdateProfileApi {

  UpdateProfileApi(IApiService api) : dio = api.get();
  Dio dio;

  @override
  Future<LoginResponse> updateProfile(Map<String, dynamic> map) async {
    try {

      final responseData = await dio.post("/api/update",data: map);

      return LoginResponse.fromJson(responseData.data);

    }on DioError catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e,t) {
      d('getDashboard');
      d(t);
      throw ResponseException(msg: e.toString());
    }
  }




  }