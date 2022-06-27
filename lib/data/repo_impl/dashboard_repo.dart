
import 'package:dartz/dartz.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/network/error_handler/error_handler.dart';
import 'package:ummah/data/models/dashboard_response.dart';
import 'package:ummah/data/remote_data_sources/dashboard_api/i_dashboard_api.dart';
import 'package:ummah/domain/repo_interfaces/dashboard_interface.dart';

class DashboardRepo implements IDashboard {

  DashboardRepo({required this.api});
  IDashboardApi api;


  @override
  Future<Either<Failure, DashboardResponse>> getDashboard() async {
    try {
      final result =  await api.getDashboard();
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }
}