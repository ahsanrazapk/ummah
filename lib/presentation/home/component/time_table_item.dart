import 'package:flutter/material.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/constant/constants.dart';
import '../model/TimeTableModel.dart';

class TimeTableItem extends BaseStateLessWidget {
  final TimeTableModel model;

  TimeTableItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Style.white, borderRadius: BorderRadius.circular(dimens.k10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            model.start,
            style: context.textTheme.bodySmall?.copyWith(fontSize: 14),
          ),
           Divider(
            height: dimens.k8,
            indent: 5,
            endIndent: 5,
          ),
          Text(model.end, style: context.textTheme.bodySmall?.copyWith(fontSize: 14),),
          dimens.k10.verticalBoxPadding(),
          Text(model.sub,  style: context.textTheme.bodySmall?.copyWith(fontSize: 16),),
        ],
      ),
    );
  }
}
