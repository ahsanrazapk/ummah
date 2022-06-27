import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/main.dart';
import 'package:ummah/application/main_config/routes/route_path.dart';
import 'package:ummah/presentation/base/base_mixin.dart';
import 'package:ummah/presentation/home/home_view_model.dart';
import 'package:ummah/presentation/login/login_view_model.dart';
import 'package:ummah/presentation/splash/splash_view_model.dart';
import 'package:ummah/presentation/utils/scroll_behavior.dart';

class UmmahApp extends StatefulWidget {
  final SetRegisteredRoutes? route;

  const UmmahApp({Key? key, this.route}) : super(key: key);

  @override
  State<UmmahApp> createState() => UmmahAppState();
}

class UmmahAppState extends State<UmmahApp> with BaseMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'UMMAH',
        builder: (context, child) => ScrollConfiguration(behavior: CustomScrollBehavior(), child: child!,),
        initialRoute: RoutePath.initialRoute,
        onGenerateRoute: widget.route,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigator.key(),
        color: Style.primary,
        theme: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            selectedRowColor: Colors.transparent,
            bottomAppBarTheme: const BottomAppBarTheme(
              color: Style.primary,
              shape:  CircularNotchedRectangle(),
              elevation: 1,
            ),
            colorScheme: const ColorScheme.light(
                background: Style.scaffoldBackground,
                secondary: Style.primary,
                primary: Style.primary,
                brightness: Brightness.light)),
      ),
    );
  }
}
