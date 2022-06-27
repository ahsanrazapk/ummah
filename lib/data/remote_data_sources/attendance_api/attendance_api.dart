import 'package:dio/dio.dart';
import 'package:ummah/application/core/exception/exception.dart';
import 'package:ummah/application/network/client/iApService.dart';
import 'package:ummah/application/network/error_handler/error_handler.dart';
import 'package:ummah/common/logger/log.dart';
import 'package:ummah/data/models/attendance_response.dart';

import 'i_attendance_api.dart';

class AttendanceApi implements IAttendanceApi {

  AttendanceApi(IApiService api) : dio = api.get();
  Dio dio;


  @override
  Future<AttendanceResponse> getAttendance() async {
    try {

      final responseData = await dio.post("/api/attendence");

      return AttendanceResponse.fromJson(responseData.data);

    }on DioError catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e, t) {
      d('getAttendance');
      d(t);
      throw ResponseException (msg: e.toString());
    }
  }
}