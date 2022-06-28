import 'package:dio/dio.dart';
import 'package:ummah/application/core/exception/exception.dart';
import 'package:ummah/application/network/client/iApService.dart';
import 'package:ummah/application/network/error_handler/error_handler.dart';
import 'package:ummah/common/logger/log.dart';
import 'package:ummah/data/models/subject_wise_result_response.dart';
import 'package:ummah/data/models/test_wise_result.dart';
import 'package:ummah/data/remote_data_sources/result_api/i_result_api.dart';

class ResultApi implements IResultApi {
  ResultApi(IApiService api) : dio = api.get();
  Dio dio;

  @override
  Future<SubjectWiseResultResponse> getSubjectWiseResult() async {
    try {
      final responseData = await dio.post("/api/test-wise-result");

      return SubjectWiseResultResponse.fromJson(responseData.data);
    } on DioError catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e, _) {
      throw ResponseException(msg: e.toString());
    }
  }

  @override
  Future<TestWiseResultResponse> getTestWiseResult() async {
    try {
      final responseData = await dio.post("/api/subject-wise-result");

      return TestWiseResultResponse.fromJson(responseData.data);
    } on DioError catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e, t) {
      d(t);
      throw ResponseException(msg: e.toString());
    }
  }
}
