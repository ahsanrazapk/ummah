import 'package:flutter/material.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/constant/Images/svgs.dart';
import 'package:ummah/data/local_data_source/preference/i_pref_helper.dart';
import 'package:ummah/di/di.dart';
import 'package:ummah/application/main_config/routes/route_path.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:provider/provider.dart';
import 'package:ummah/presentation/home/home_view_model.dart';
import 'package:ummah/presentation/splash/splash_view_model.dart';

class SplashScreen extends BaseStateFullWidget {
   SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late IPrefHelper pref;

  @override
  void initState() {
    super.initState();
    pref = inject<IPrefHelper>();
    context.read<SplashViewModel>().navDelay(() async {
      if(pref.retrieveToken()!=null) {
        await context.read<HomeViewModel>().getDashboard();
        await context.read<HomeViewModel>().getAttendance();
        await context.read<HomeViewModel>().getUser();
        widget.navigator.pushNamedAndRemoveUntil(RoutePath.home);
      }else{
        widget.navigator.pushNamedAndRemoveUntil(RoutePath.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.primary,
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgAssets.appLogo,
            Positioned(bottom: -30, left: -60, child: SvgAssets.design),
          ],
        ),
      ),
    );
  }
}
