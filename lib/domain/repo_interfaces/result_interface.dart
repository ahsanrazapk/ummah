import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/data/models/subject_wise_result_response.dart';
import 'package:ummah/data/models/test_wise_result.dart';

abstract class IResult {
  Future<Either<Failure, TestWiseResultResponse>> getTestWiseResult();
  Future<Either<Failure, SubjectWiseResultResponse>> getSubjectWiseResult();
}
