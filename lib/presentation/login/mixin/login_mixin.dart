

import 'package:flutter/material.dart';
import 'package:ummah/presentation/base/base_widget.dart';

mixin LoginMixin<T extends BaseStateFullWidget> on State<T> {

  final TextEditingController idController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final idKey = GlobalKey();
  final passKey = GlobalKey();
  final formKey = GlobalKey<FormState>();

  bool get validate => formKey.currentState!.validate();
}