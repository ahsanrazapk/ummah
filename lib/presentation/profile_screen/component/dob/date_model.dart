
import 'package:ummah/presentation/base/base_mixin.dart';

abstract class BasePickerModel with BaseMixin {

  String? leftStringAtIndex(int index);
  String? middleStringAtIndex(int index);
  String? rightStringAtIndex(int index);
  void setLeftIndex(int index);
  void setMiddleIndex(int index);
  void setRightIndex(int index);
  int currentLeftIndex();
  int currentMiddleIndex();
  int currentRightIndex();
  DateTime? finalTime();
  String leftDivider();
  String rightDivider();
  List<int> layoutProportions();
}

class CommonPickerModel extends BasePickerModel {
  late List<String> leftList;
 late  List<String> middleList;
  late List<String> rightList;
  late DateTime currentTime;
  late int _currentLeftIndex;
  late int _currentMiddleIndex;
 late  int _currentRightIndex;


  CommonPickerModel();

  @override
  String? leftStringAtIndex(int index) {
    return null;
  }

  @override
  String? middleStringAtIndex(int index) {
    return null;
  }

  @override
  String? rightStringAtIndex(int index) {
    return null;
  }

  @override
  int currentLeftIndex() {
    return _currentLeftIndex;
  }

  @override
  int currentMiddleIndex() {
    return _currentMiddleIndex;
  }

  @override
  int currentRightIndex() {
    return _currentRightIndex;
  }

  @override
  void setLeftIndex(int index) {
    _currentLeftIndex = index;
  }

  @override
  void setMiddleIndex(int index) {
    _currentMiddleIndex = index;
  }

  @override
  void setRightIndex(int index) {
    _currentRightIndex = index;
  }

  @override
  String leftDivider() {
    return "";
  }

  @override
  String rightDivider() {
    return "";
  }

  @override
  List<int> layoutProportions() {
    return [1, 1, 1];
  }

  @override
  DateTime? finalTime() {
    return null;
  }

}

