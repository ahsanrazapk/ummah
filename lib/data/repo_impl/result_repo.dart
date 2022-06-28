import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/network/error_handler/error_handler.dart';
import 'package:ummah/data/models/subject_wise_result_response.dart';
import 'package:ummah/data/models/test_wise_result.dart';
import 'package:ummah/data/remote_data_sources/result_api/i_result_api.dart';
import 'package:ummah/domain/repo_interfaces/result_interface.dart';

class ResultRepo implements IResult {

  ResultRepo({required this.api});
  IResultApi api;


  @override
  Future<Either<Failure, SubjectWiseResultResponse>> getSubjectWiseResult() async {
    try {
      final result =  await api.getSubjectWiseResult();
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }

  }

  @override
  Future<Either<Failure, TestWiseResultResponse>> getTestWiseResult() async {
    try {
      final result =  await api.getTestWiseResult();
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }

  }
}