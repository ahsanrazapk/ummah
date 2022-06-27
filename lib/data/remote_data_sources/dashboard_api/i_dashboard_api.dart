import 'package:ummah/data/models/dashboard_response.dart';


abstract class IDashboardApi {
  Future<DashboardResponse> getDashboard();
}