
import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/core/usecases/usecase.dart';
import 'package:ummah/data/models/login_response.dart';
import 'package:ummah/domain/entities/login_entity.dart';
import 'package:ummah/domain/repo_interfaces/login_interface.dart';

class LoginUseCase implements UseCase<LoginResponse, LoginEntity> {
  LoginUseCase(this.repository);

  final ILogin repository;

  @override
  Future<Either<Failure, LoginResponse>> call(LoginEntity params) async =>

     await repository.login(params.toMap());
}

