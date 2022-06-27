
import 'package:get_it/get_it.dart';
import 'package:ummah/di/di.dart';

final serviceLocator = GetIt.instance;

Future<void> initMainServiceLocator() async {
 await  setupLocator();
  return serviceLocator.allReady();
}