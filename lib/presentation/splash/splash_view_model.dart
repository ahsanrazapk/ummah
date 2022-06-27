import 'package:ummah/presentation/base/base_view_model.dart';

typedef OnComplete = void Function();
class SplashViewModel extends BaseViewModel {
  SplashViewModel() {
    //ignore
  }

  final int delay = 10;

  void navDelay(OnComplete onComplete) {
    Future.delayed(Duration(seconds: delay), onComplete);
  }
}
