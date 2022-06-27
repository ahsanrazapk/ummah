import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ummah/application/core/routes/routes.dart';
import 'package:ummah/application/main_config/routes/route_path.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/data/models/attendance_response.dart';
import 'package:ummah/presentation/about_screen/about_screen.dart';
import 'package:ummah/presentation/attendance/attendance_screen.dart';
import 'package:ummah/presentation/exam_result/exam_result_screen.dart';
import 'package:ummah/presentation/exam_result/pages/overall_result/over_all_result.dart';
import 'package:ummah/presentation/exam_result/pages/subject_wise_result/subject_wise_result.dart';
import 'package:ummah/presentation/exam_result/pages/subject_wise_result/subject_wise_result_view_model.dart';
import 'package:ummah/presentation/exam_result/pages/test_wise_result/test_wise_result.dart';
import 'package:ummah/presentation/exam_result/pages/test_wise_result/test_wise_result_view_model.dart';
import 'package:ummah/presentation/fee_screen/fee_screen.dart';
import 'package:ummah/presentation/gallery_screen/gallery_screen.dart';
import 'package:ummah/presentation/home/home_screen.dart';
import 'package:ummah/presentation/login/login_screen.dart';
import 'package:ummah/presentation/notification_screen/notification_screen.dart';
import 'package:ummah/presentation/profile_screen/edit_profile_screen.dart';
import 'package:ummah/presentation/profile_screen/profile_screen.dart';
import 'package:ummah/presentation/splash/splash_screen.dart';
import 'package:ummah/presentation/weekly_timetable/weekly_time_table_screen.dart';
import 'package:ummah/presentation/weekly_timetable/weekly_timetable_view_model.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
     final args = settings.arguments;
    switch (settings.name) {
      case RoutePath.initialRoute:
        return PageRouter.fadeThrough(() => SplashScreen());
      case RoutePath.login:
        return PageRouter.fadeThrough(() => LoginScreen());
      case RoutePath.home:
        return PageRouter.fadeThrough(() => HomeScreen());
      case RoutePath.att:
        return PageRouter.fadeThrough(() => AttendanceScreen(attendanceResponse: args as AttendanceData,));
      case RoutePath.examResult:
        return PageRouter.fadeThrough(() => ExamResultScreen());
      case RoutePath.overallResult:
        return PageRouter.fadeThrough(() => OverAllResult());
      case RoutePath.subjectWiseResult:
        return PageRouter.fadeThrough(() =>
            ChangeNotifierProvider(
                create: (BuildContext context) => SubjectWiseResultViewModel(), child: SubjectWiseResult()));
      case RoutePath.testWiseResult:
        return PageRouter.fadeThrough(() =>
            ChangeNotifierProvider(
                create: (BuildContext context) => TestWiseResultViewModel(), child: TestWiseResult()));
      case RoutePath.weeklyTimetable:
        return PageRouter.fadeThrough(() =>
            ChangeNotifierProvider(
              create: (context) => WeeklyTimetableViewModel(),
              child: WeeklyTimetableScreen(),
            ));
      case RoutePath.profile:
        return PageRouter.fadeThrough(() => ProfileScreen());
      case RoutePath.editProfile:
        return PageRouter.clipperRoute(() => EditProfileScreen());
      case RoutePath.fee:
        return PageRouter.fadeThrough(() => FeeScreen());
      case RoutePath.gallery:
        return PageRouter.fadeThrough(() => GalleryScreen());
      case RoutePath.about:
        return PageRouter.fadeThrough(() => AboutScreen());
      case RoutePath.notify:
        return PageRouter.fadeThrough(() => NotificationScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Container(
            color: Style.scaffoldBackground,
            child: const Text('Page Not Found'),
          ),
        ),
      );
    });
  }
}
