import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/data/models/dashboard_response.dart';

abstract class IDashboard {
  Future<Either<Failure, DashboardResponse>> getDashboard();
}
