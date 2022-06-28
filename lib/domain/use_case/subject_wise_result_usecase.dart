import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/core/usecases/usecase.dart';
import 'package:ummah/data/models/subject_wise_result_response.dart';
import 'package:ummah/domain/repo_interfaces/result_interface.dart';

class SubjectWiseResultUseCase implements UseCase<SubjectWiseResultResponse, NoParams> {
  SubjectWiseResultUseCase(this.repository);

  final IResult repository;

  @override
  Future<Either<Failure, SubjectWiseResultResponse>> call(NoParams params) async {
   return await repository.getSubjectWiseResult();
  }
}

