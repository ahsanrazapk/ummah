import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ummah/application/core/usecases/usecase.dart';
import 'package:ummah/data/local_data_source/preference/i_pref_helper.dart';
import 'package:ummah/data/models/attendance_response.dart';
import 'package:ummah/data/models/dashboard_response.dart';
import 'package:ummah/data/models/login_response.dart';
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
  final BehaviorSubject<LoginResponse> _loginSubject = BehaviorSubject<LoginResponse>();
  late IDashboard _repo;
  late IAttendance _attRepo;
  late IPrefHelper _prefHelper;
  String _userName = '-';
  String _profileUrl = '-';

  HomeViewModel() {
    _repo = inject<IDashboard>();
    _attRepo = inject<IAttendance>();
    _prefHelper = inject<IPrefHelper>();
  }


  String get userName => _userName;

  set userName(String value) {
    _userName = value;
    setState();
  }

  String get profileUrl => _profileUrl;

  set profileUrl(String value) {
    _profileUrl = value;
    setState();
  }

  updateProfile(String url ,String name) {
    _profileUrl = url;
    _userName = name;
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

  Future<void> getUser() async {
    LoginResponse? response = _prefHelper.retrieveUser();
    if (response != null) {
    final  userName =  response.data?.name ?? '-';
   final  profileUrl = response.data?.profilePhoto ?? 'https://via.placeholder.com/50x50';
    updateProfile(profileUrl, userName);
      _loginSubject.sink.add(response);
    }
  }

  Stream<HomeResponseModel> getStream() {
    return Rx.combineLatest(
      [_dashboardSubject, _attendanceSubject, _loginSubject],
      (values) => HomeResponseModel.fromMap(
          {'dashboardResponse': values[0], 'attendanceResponse': values[1], 'loginResponse': values[2]}),
    ).asBroadcastStream();
  }

  @override
  void dispose() {
    super.dispose();
    _dashboardSubject.close();
    _attendanceSubject.close();
    _loginSubject.close();
  }


}
