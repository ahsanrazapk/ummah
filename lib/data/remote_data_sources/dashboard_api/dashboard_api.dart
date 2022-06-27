import 'package:dio/dio.dart';
import 'package:ummah/application/core/exception/exception.dart';
import 'package:ummah/application/network/client/iApService.dart';
import 'package:ummah/application/network/error_handler/error_handler.dart';
import 'package:ummah/common/logger/log.dart';
import 'package:ummah/data/models/dashboard_response.dart';

import 'i_dashboard_api.dart';

class DashboardApi implements IDashboardApi {

  DashboardApi(IApiService api) : dio = api.get();
  Dio dio;


  @override
  Future<DashboardResponse> getDashboard() async {
    try {

      final responseData = await dio.post("/api/dashboard");

      return DashboardResponse.fromJson(responseData.data);

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