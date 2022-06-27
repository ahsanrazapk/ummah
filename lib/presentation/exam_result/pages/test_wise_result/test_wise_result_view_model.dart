import 'package:ummah/presentation/base/base_view_model.dart';


class TestWiseResultViewModel extends BaseViewModel {
  TestWiseResultViewModel() {
    //ignore
  }
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

}
