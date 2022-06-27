import 'package:flutter/cupertino.dart';
import 'package:ummah/constant/constants.dart';

class ProfileModel {
  String name;
  String value;
  TextEditingController? controller;
  bool readOnly;
  GestureTapCallback? onTap;



  ProfileModel({required this.name, this.value = Constants.notAvailable, this.controller, this.readOnly = false, this.onTap});


  TextEditingController? isValueAvailAble() => value == Constants.notAvailable ? null : TextEditingController(text: value);
  String? isLabelShow() => value == Constants.notAvailable ? value : null;

}