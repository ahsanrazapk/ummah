import 'package:flutter/material.dart';
import 'package:ummah/application/core/result.dart';
import 'package:ummah/presentation/base/base_view_model.dart';
import 'package:ummah/presentation/login/login_screen.dart';


class SubjectWiseResultViewModel extends BaseViewModel {
  SubjectWiseResultViewModel() {
    //ignore
  }
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

}
