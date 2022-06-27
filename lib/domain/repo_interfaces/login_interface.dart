import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/data/models/login_response.dart';

abstract class ILogin {
  Future<Either<Failure, LoginResponse>> login(Map<String, dynamic> map);
}
