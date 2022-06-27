import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:ummah/constant/Images/svgs.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/data/models/attendance_response.dart';
import 'package:ummah/presentation/attendance/mixin/att_mixin.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/widgets/main_body.dart';
import 'package:ummah/presentation/widgets/section_big_title_icon.dart';
import 'package:ummah/presentation/widgets/section_box.dart';

class AttendanceScreen extends BaseStateFullWidget {
  final AttendanceData? attendanceResponse;

  AttendanceScreen({Key? key, this.attendanceResponse}) : super(key: key);

  @override
  AttendanceScreenState createState() => AttendanceScreenState();
}

class AttendanceScreenState extends State<AttendanceScreen> with AttendanceMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: MainBody(
        extendedBottom: false,
        child: Column(
          children: [
            Stack(
              alignment: const Alignment(0.0, 1.35),
              children: [
                SectionBox(
                  color: Style.card1,
                  shadow: true,
                  width: context.width,
                  height: context.getHeight(0.5),
                  padding: EdgeInsets.all(widget.dimens.k15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Overall Attendance',
                        style: context.textTheme.bodyMedium?.copyWith(color: Style.textColor),
                      ),
                      Expanded(
                        child: SfRadialGauge(enableLoadingAnimation: true, axes: <RadialAxis>[
                          RadialAxis(
                            minimum: 0,
                            maximum: 100,
                            startAngle: 270,
                            endAngle: 270,
                            showLabels: false,
                            showTicks: false,
                            radiusFactor: 0.75,
                            axisLineStyle: const AxisLineStyle(
                                cornerStyle: CornerStyle.bothFlat, color: Colors.black12, thickness: 10),
                            pointers: <GaugePointer>[
                              RangePointer(
                                value: widget.utils.cast(widget.attendanceResponse?.overallAttendance),
                                cornerStyle: CornerStyle.bothFlat,
                                width: 10,
                                sizeUnit: GaugeSizeUnit.logicalPixel,
                                color: const Color(0XFF327AFF),
                              ),
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                  angle: 90,
                                  axisValue: 5,
                                  positionFactor: 0.2,
                                  widget: Text(
                                      widget.utils.symbolText(
                                          widget.attendanceResponse?.overallAttendance, '%'),
                                      style: context.textTheme.titleLarge))
                            ],
                          )
                        ]),
                      ),
                      widget.dimens.k25.verticalBoxPadding(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.dimens.k8.horizontalBoxPadding(),
                    SectionBox(
                      padding: EdgeInsets.symmetric(horizontal: widget.dimens.k25),
                      color: Style.boxColor1,
                      height: context.getHeight(0.15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                           widget.utils.compactText(widget.attendanceResponse?.totalAbsent),
                            style:
                                context.textTheme.headline4?.copyWith(color: Style.white, fontWeight: FontWeight.w800),
                          ),
                          widget.dimens.k5.verticalBoxPadding(),
                          Text(
                            'Absent',
                            style: context.textTheme.bodyMedium?.copyWith(color: Style.white),
                          ),
                        ],
                      ),
                    ),
                    SectionBox(
                      padding: EdgeInsets.symmetric(horizontal: widget.dimens.k25),
                      color: Style.boxColor2,
                      height: context.getHeight(0.15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                      widget.utils.compactText(widget.attendanceResponse?.totalPresent),
                            style:
                                context.textTheme.headline4?.copyWith(color: Style.white, fontWeight: FontWeight.w800),
                          ),
                          widget.dimens.k5.verticalBoxPadding(),
                          Text(
                            'Present',
                            style: context.textTheme.bodyMedium?.copyWith(color: Style.white),
                          ),
                        ],
                      ),
                    ),
                    SectionBox(
                      padding: EdgeInsets.symmetric(horizontal: widget.dimens.k25),
                      color: Style.boxColor3,
                      height: context.getHeight(0.15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.utils.compactText(widget.attendanceResponse?.totalLeave),
                            style:
                                context.textTheme.headline4?.copyWith(color: Style.white, fontWeight: FontWeight.w800),
                          ),
                          widget.dimens.k5.verticalBoxPadding(),
                          Text(
                            'Leave',
                            style: context.textTheme.bodyMedium?.copyWith(color: Style.white),
                          ),
                        ],
                      ),
                    ),
                    widget.dimens.k8.horizontalBoxPadding(),
                  ],
                )
              ],
            ),
            widget.dimens.k60.verticalBoxPadding(),
            ...widget.attendanceResponse?.monthWisePercentage?.map((e) => Padding(
              padding: EdgeInsets.all(widget.dimens.k5),
              child: ListTile(
                title: Text(
                  widget.utils.compactText(e.month),
                  style:
                  context.textTheme.titleLarge?.copyWith(color: Style.primary, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Monthly Progress ${widget.utils.symbolText(
                    e.monthlyProgress, '%')}',
                    style: context.textTheme.bodyMedium?.copyWith(color: Style.textColor)),
                trailing: SectionBigTitleWithIcon(
                  gap: 0,
                  title: 'View',
                  icon: SvgAssets.forward,
                  titleStyle: context.textTheme.titleMedium?.copyWith(color: Style.primary),
                ),
                tileColor: Style.card1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.dimens.k10)),
              ),
            )).toList() ?? []
          ],
        ),
      ),
    );
  }
}
