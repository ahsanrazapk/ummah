import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/data/models/attendance_response.dart';
import 'package:ummah/data/models/dashboard_response.dart';

abstract class IAttendance {
  Future<Either<Failure, AttendanceResponse>> getAttendance();
}
