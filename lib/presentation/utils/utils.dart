import 'package:intl/intl.dart';

class Utils {
  String symbolText(dynamic text, String symbol, [bool isAfter = true]) {
    return text == null
        ? '-'
        : isAfter
            ? '${NumberFormat.decimalPattern().format(text)} $symbol'
            : '$symbol ${NumberFormat.decimalPattern().format(text)}';
  }

  double cast(int? value) => value?.toDouble() ?? 0.0;

  String compactProfileUrl(dynamic value) => value == null ? 'https://via.placeholder.com/250x250' : value.toString();

  String compactText(dynamic value) => value == null ? '-' : value.toString();
  String compactEmptyText(dynamic value) => value == null ? '' : value.toString();

  T compactEnumText<T>(int? value, T) => value == null ? '-' : T[value];

  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  String getPercentage(int obtain,int total){
    return ((obtain/total) * 100).roundToDouble().toStringAsFixed(2);
  }
}
