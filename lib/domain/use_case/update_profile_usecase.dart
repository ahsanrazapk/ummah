
import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/core/usecases/usecase.dart';
import 'package:ummah/data/models/login_response.dart';
import 'package:ummah/domain/entities/update_profile_entity.dart';
import 'package:ummah/domain/repo_interfaces/update_profile_interface.dart';

class UpdateProfileUseCase implements UseCase<LoginResponse, UpdateProfileEntity> {
  UpdateProfileUseCase(this.repository);

  final IUpdateProfile repository;

  @override
  Future<Either<Failure, LoginResponse>> call(UpdateProfileEntity params) async =>

     await repository.updateProfile(params.toJson());
}

