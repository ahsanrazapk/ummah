import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/data/local_data_source/preference/pref_helper.dart';
import 'package:ummah/data/local_data_source/preference/i_pref_helper.dart';
import 'package:ummah/application/network/client/api_service.dart';
import 'package:ummah/application/network/external_values/ExternalValues.dart';
import 'package:ummah/application/network/client/iApService.dart';
import 'package:ummah/data/remote_data_sources/attendance_api/attendance_api.dart';
import 'package:ummah/data/remote_data_sources/attendance_api/i_attendance_api.dart';
import 'package:ummah/data/remote_data_sources/dashboard_api/dashboard_api.dart';
import 'package:ummah/data/remote_data_sources/dashboard_api/i_dashboard_api.dart';
import 'package:ummah/data/remote_data_sources/login_api/i_login_api.dart';
import 'package:ummah/data/remote_data_sources/login_api/login_api.dart';
import 'package:ummah/data/remote_data_sources/result_api/i_result_api.dart';
import 'package:ummah/data/remote_data_sources/result_api/result_api.dart';
import 'package:ummah/data/remote_data_sources/update_profile_api/i_update_profile_api.dart';
import 'package:ummah/data/remote_data_sources/update_profile_api/update_profile_api.dart';
import 'package:ummah/data/repo_impl/attendance_repo.dart';
import 'package:ummah/data/repo_impl/dashboard_repo.dart';
import 'package:ummah/data/repo_impl/login_repo.dart';
import 'package:ummah/data/repo_impl/result_repo.dart';
import 'package:ummah/data/repo_impl/update_profile_repo.dart';
import 'package:ummah/domain/repo_interfaces/attendance_interface.dart';
import 'package:ummah/domain/repo_interfaces/dashboard_interface.dart';
import 'package:ummah/domain/repo_interfaces/login_interface.dart';
import 'package:ummah/domain/repo_interfaces/result_interface.dart';
import 'package:ummah/domain/repo_interfaces/update_profile_interface.dart';
import 'package:ummah/presentation/exam_result/exam_result_view_model.dart';
import 'package:ummah/presentation/utils/utils.dart';
import 'package:ummah/services/navService/INavigationService.dart';
import 'package:ummah/services/navService/navService.dart';

final inject = GetIt.instance;

Future<void> setupLocator() async {
  inject.registerSingletonAsync(() => SharedPreferences.getInstance());
  //utils
  inject.registerLazySingleton<INavigationService>(() => NavigationService());
  inject.registerLazySingleton<IPrefHelper>(() => PrefHelper(inject()));
  inject.registerLazySingleton<Px>(() => Px());
  inject.registerLazySingleton<Utils>(() => Utils());
  // Api client
  inject.registerLazySingleton<IApiService>(() => ApiService.create(externalValues: ExternalValues()));

  inject.registerLazySingleton<ILoginApi>(() => LoginApi(inject()));
  inject.registerLazySingleton<ILogin>(() => LoginRepo(api: inject()));

  inject.registerLazySingleton<IDashboardApi>(() => DashboardApi(inject()));
  inject.registerLazySingleton<IDashboard>(() => DashboardRepo(api: inject()));

  inject.registerLazySingleton<IAttendanceApi>(() => AttendanceApi(inject()));
  inject.registerLazySingleton<IAttendance>(() => AttendanceRepo(api: inject()));

  inject.registerLazySingleton<IUpdateProfileApi>(() => UpdateProfileApi(inject()));
  inject.registerLazySingleton<IUpdateProfile>(() => UpdateProfileRepo(api: inject()));

  inject.registerLazySingleton<IResultApi>(() => ResultApi(inject()));
  inject.registerLazySingleton<IResult>(() => ResultRepo(api: inject()));

  inject.registerLazySingleton<ExamResultViewModel>(() => ExamResultViewModel(repo: inject()));

}
