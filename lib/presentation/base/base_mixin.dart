import 'package:ummah/constant/constants.dart';
import 'package:ummah/di/di.dart';
import 'package:ummah/presentation/utils/utils.dart';
import 'package:ummah/services/navService/INavigationService.dart';


mixin BaseMixin {
  final INavigationService _navigator = inject<INavigationService>();
  final Px _dimens = inject<Px>();
  final Utils _utils = inject<Utils>();

  INavigationService get navigator => _navigator;
  Px get dimens => _dimens;
  Utils get utils => _utils;
}
