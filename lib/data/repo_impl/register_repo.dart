import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/network/error_handler/error_handler.dart';
import 'package:ummah/data/models/login_response.dart';
import 'package:ummah/data/remote_data_sources/login_api/i_login_api.dart';
import 'package:ummah/domain/repo_interfaces/login_interface.dart';

class LoginRepo implements ILogin {
  LoginRepo({required this.api});
  ILoginApi api;
  @override
  Future<Either<Failure, LoginResponse>> login(Map<String, dynamic> map) async {
    try {
      final result = await api.login(map);
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }
}