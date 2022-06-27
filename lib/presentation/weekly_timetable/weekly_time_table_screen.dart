import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/weekly_timetable/component/expand_list.dart';
import 'package:ummah/presentation/weekly_timetable/weekly_timetable_view_model.dart';
import 'package:ummah/presentation/widgets/main_body.dart';

import 'mixin/weekly_time_table_mixin.dart';

class WeeklyTimetableScreen extends BaseStateFullWidget {
  WeeklyTimetableScreen({Key? key}) : super(key: key);

  @override
  WeeklyTimetableScreenState createState() => WeeklyTimetableScreenState();
}

class WeeklyTimetableScreenState extends State<WeeklyTimetableScreen> with WeeklyTimetableMixin {

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WeeklyTimetableViewModel>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: MainBody(extendedBottom: false,child: Column(children: List.generate(10, (index) => ExpandList(
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              widget.dimens.k10.verticalBoxPadding(),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Text(
                    "Subject",
                    style: context.textTheme.titleSmall?.copyWith(color: Style.white,fontWeight: FontWeight.w500),
                  ),  Text(
                    "Time",
                    style: context.textTheme.titleSmall?.copyWith(color: Style.white,fontWeight: FontWeight.w500),
                  ),  Text(
                    "Room",
                    style: context.textTheme.titleSmall?.copyWith(color: Style.white,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              widget.dimens.k10.verticalBoxPadding(),
              for (var i = 0; i < 8; i++)
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: widget.dimens.k5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mathematics",
                        style: context.textTheme.bodySmall?.copyWith(color: Style.card1,fontWeight: FontWeight.normal),
                      ),  Text(
                        "07:30-08:15",
                        style: context.textTheme.bodySmall?.copyWith(color: Style.card1,fontWeight: FontWeight.normal),
                      ),  Text(
                        "ABC 123",
                        style: context.textTheme.bodySmall?.copyWith(color: Style.card1,fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        title:  'Monday',
        key: UniqueKey(),
        onTapPadding: widget.dimens.k8,
        closedHeight: widget.dimens.k50,
        borderRadius: widget.dimens.k10,
        openedHeight: widget.dimens.k300,
      ),).toList(),))
    );
  }
}

