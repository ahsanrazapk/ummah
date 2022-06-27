import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ummah/application/main_config/main_config.dart' as config;
import 'package:ummah/application/app.dart';
import 'package:ummah/application/main_config/routes/route_generator.dart';
import 'common/logger/log.dart';

typedef SetRegisteredRoutes = Route<dynamic> Function(RouteSettings settings);

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Color(0xFF2A357D)));
    SystemChrome.setApplicationSwitcherDescription(const ApplicationSwitcherDescription(primaryColor: 0xFF2A357D));
   await config.initMainServiceLocator();
   const routes = RouteGenerator.generateRoute;
    const root = UmmahApp(route: routes);
    runApp(root);
  }, (error, stackTrace) async {
    d('ZonedGuardedError:  ${error.toString()} $stackTrace');
  });
}
