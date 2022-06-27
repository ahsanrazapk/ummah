import 'package:flutter/cupertino.dart';
import 'package:ummah/constant/constants.dart';

class ProfileModel {
  String name;
  String value;
  TextEditingController? controller;


  ProfileModel({required this.name, this.value = Constants.notAvailable, this.controller});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
      'controller': controller,
    };
  }

  TextEditingController? isValueAvailAble() => value == Constants.notAvailable ? null : TextEditingController(text: value);
  String? isLabelShow() => value == Constants.notAvailable ? value : null;

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] as String,
      value: map['value'] as String,
      controller: map['controller'] as TextEditingController,
    );
  }
}