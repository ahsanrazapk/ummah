import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/data/models/login_response.dart';

abstract class IUpdateProfile {
  Future<Either<Failure, LoginResponse>> updateProfile(Map<String, dynamic> map);

}
