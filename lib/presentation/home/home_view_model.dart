import 'package:rxdart/rxdart.dart';
import 'package:ummah/application/core/usecases/usecase.dart';
import 'package:ummah/data/models/attendance_response.dart';
import 'package:ummah/data/models/dashboard_response.dart';
import 'package:ummah/di/di.dart';
import 'package:ummah/domain/repo_interfaces/attendance_interface.dart';
import 'package:ummah/domain/repo_interfaces/dashboard_interface.dart';
import 'package:ummah/domain/use_case/attendance_usecase.dart';
import 'package:ummah/domain/use_case/dashboard_usecase.dart';
import 'package:ummah/presentation/base/base_view_model.dart';
import 'package:ummah/presentation/home/model/home_response_model.dart';

import 'enums/page_index.dart';

class HomeViewModel extends BaseViewModel {
  final BehaviorSubject<DashboardResponse> _dashboardSubject = BehaviorSubject<DashboardResponse>();
  final BehaviorSubject<AttendanceResponse> _attendanceSubject = BehaviorSubject<AttendanceResponse>();
  late IDashboard _repo;
  late IAttendance _attRepo;

  HomeViewModel() {
    _repo = inject<IDashboard>();
    _attRepo = inject<IAttendance>();
  }

  PageIndex _pageIndex = PageIndex.home;

  PageIndex get pageIndex => _pageIndex;

  onPageChange(PageIndex pageIndex) {
    _pageIndex = pageIndex;
    setState();
  }

  Future<void> getDashboard() async {
    final _dashboard = DashboardUseCase(_repo);
    final dashboardData = await _dashboard(NoParams());
    dashboardData.fold((error) {
      _dashboardSubject.sink.addError(error);
    }, (response) {
      _dashboardSubject.sink.add(response);
    });
  }

  Future<void> getAttendance() async {
    final _attendance = AttendanceUseCase(_attRepo);
    final attendanceData = await _attendance(NoParams());
    attendanceData.fold((error) {
      _attendanceSubject.sink.addError(error);
    }, (response) {
      _attendanceSubject.sink.add(response);
    });
  }



  Stream<HomeResponseModel> getStream() {
    return Rx.combineLatest2(
      _dashboardSubject, _attendanceSubject,
      (value1, value2) => HomeResponseModel.fromMap(
          {'dashboardResponse': value1, 'attendanceResponse': value2,}),
    ).asBroadcastStream();
  }

  @override
  void dispose() {
    super.dispose();
    _dashboardSubject.close();
    _attendanceSubject.close();
  }


}
