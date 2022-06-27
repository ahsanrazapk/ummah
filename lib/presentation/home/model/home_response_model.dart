import 'package:ummah/data/models/attendance_response.dart';
import 'package:ummah/data/models/dashboard_response.dart';

class HomeResponseModel {
  DashboardResponse dashboardResponse;
  AttendanceResponse attendanceResponse;

  HomeResponseModel({required this.dashboardResponse, required this.attendanceResponse});

  factory HomeResponseModel.fromMap(Map<String, dynamic> map) {
    return HomeResponseModel(
      dashboardResponse: map['dashboardResponse'] as DashboardResponse,
      attendanceResponse: map['attendanceResponse'] as AttendanceResponse,
    );
  }
}