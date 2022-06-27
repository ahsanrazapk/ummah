import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/network/error_handler/error_handler.dart';
import 'package:ummah/data/models/login_response.dart';
import 'package:ummah/data/remote_data_sources/update_profile_api/i_update_profile_api.dart';
import 'package:ummah/domain/repo_interfaces/update_profile_interface.dart';

class UpdateProfileRepo implements IUpdateProfile {
  UpdateProfileRepo({required this.api});
  IUpdateProfileApi api;
  @override
  Future<Either<Failure, LoginResponse>> updateProfile(Map<String, dynamic> map) async {
    try {
      final result = await api.updateProfile(map);
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }
}