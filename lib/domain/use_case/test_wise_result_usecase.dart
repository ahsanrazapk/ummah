import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/core/usecases/usecase.dart';
import 'package:ummah/data/models/test_wise_result.dart';
import 'package:ummah/domain/repo_interfaces/result_interface.dart';

class TestWiseResultUseCase implements UseCase<TestWiseResultResponse, NoParams> {
  TestWiseResultUseCase(this.repository);

  final IResult repository;

  @override
  Future<Either<Failure, TestWiseResultResponse>> call(NoParams params) async {
   return await repository.getTestWiseResult();
  }
}

