
import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/network/error_handler/error_handler.dart';
import 'package:ummah/data/models/attendance_response.dart';
import 'package:ummah/data/remote_data_sources/attendance_api/i_attendance_api.dart';
import 'package:ummah/domain/repo_interfaces/attendance_interface.dart';

class AttendanceRepo implements IAttendance {

  AttendanceRepo({required this.api});
  IAttendanceApi api;


  @override
  Future<Either<Failure, AttendanceResponse>> getAttendance() async {
    try {
      final result =  await api.getAttendance();
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }
}