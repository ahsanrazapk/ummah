import 'package:ummah/data/models/subject_wise_result_response.dart';
import 'package:ummah/data/models/test_wise_result.dart';


abstract class IResultApi {
  Future<SubjectWiseResultResponse> getSubjectWiseResult();
  Future<TestWiseResultResponse> getTestWiseResult();
}