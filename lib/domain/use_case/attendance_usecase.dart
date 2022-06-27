
import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/core/usecases/usecase.dart';
import 'package:ummah/data/local_data_source/preference/i_pref_helper.dart';
import 'package:ummah/data/models/attendance_response.dart';
import 'package:ummah/data/models/dashboard_response.dart';
import 'package:ummah/data/models/login_response.dart';
import 'package:ummah/domain/entities/login_entity.dart';
import 'package:ummah/domain/repo_interfaces/attendance_interface.dart';
import 'package:ummah/domain/repo_interfaces/dashboard_interface.dart';
import 'package:ummah/domain/repo_interfaces/login_interface.dart';

class AttendanceUseCase implements UseCase<AttendanceResponse, NoParams> {
  AttendanceUseCase(this.repository);

  final IAttendance repository;

  @override
  Future<Either<Failure, AttendanceResponse>> call(NoParams params) async {
   return await repository.getAttendance();
  }
}

