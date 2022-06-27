
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/presentation/profile_screen/component/dob/date_model.dart';

class CustomPicker extends CommonPickerModel {
 


  CustomPicker({required DateTime currentTime}) : super() {
    this.currentTime = currentTime;
    setLeftIndex(currentTime.month);
    setMiddleIndex(currentTime.day);
    setRightIndex(currentTime.year);
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= currentTime.month && index <= 12) {
      return Constants.months(index);
    } else {
      return null;
    }
  }

  @override
  String? middleStringAtIndex(int index) {
    final DateTime date = DateTime(currentRightIndex(), currentLeftIndex());
    final DateTime lastDay = date.lastDayOfMonth();
    final int start = date.month == currentTime.month ? currentTime.day : 1;

    if (index >= start && index <= lastDay.day) {
      return utils.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index >= 1900 && index <= 2050) {
      return utils.digits(index, 4);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [2, 1, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
            currentRightIndex(),
            currentLeftIndex(),
            currentMiddleIndex(),
          )
        : DateTime(
            currentRightIndex(),
            currentLeftIndex(),
            currentMiddleIndex(),
          );
  }
}
