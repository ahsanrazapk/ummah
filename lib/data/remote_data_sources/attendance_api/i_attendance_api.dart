import 'package:ummah/data/models/attendance_response.dart';
import 'package:ummah/data/models/dashboard_response.dart';


abstract class IAttendanceApi {
  Future<AttendanceResponse> getAttendance();
}