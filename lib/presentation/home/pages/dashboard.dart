import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_charts/charts.dart' hide CornerStyle;
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/network/error_handler/error_handler.dart';
import 'package:ummah/common/logger/log.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/application/main_config/routes/route_path.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/home/component/time_table_item.dart';
import 'package:ummah/presentation/home/home_view_model.dart';
import 'package:ummah/presentation/home/mixin/home_mixin.dart';
import 'package:ummah/presentation/home/model/ChartData.dart';
import 'package:ummah/presentation/home/model/TimeTableModel.dart';
import 'package:ummah/presentation/home/model/home_response_model.dart';
import 'package:ummah/presentation/profile_screen/profile_view_model.dart';
import 'package:ummah/presentation/widgets/main_body.dart';
import 'package:ummah/presentation/widgets/section_big_title_icon.dart';
import 'package:ummah/presentation/widgets/section_box.dart';
import 'package:ummah/presentation/widgets/section_horizontal_widget.dart';
import 'package:ummah/presentation/widgets/section_title.dart';

class Dashboard extends BaseStateFullWidget {
  final HomeViewModel viewModel;

  Dashboard({Key? key, required this.viewModel}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> with HomeMixin {
  @override
  void initState() {
    super.initState();
    d('home initState at ${DateTime.now().toIso8601String()}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    d('home didChangeDependencies at ${DateTime.now().toIso8601String()}');
    context.read<HomeViewModel>().getDashboard();
    context.read<HomeViewModel>().getAttendance();
    context.read<ProfileViewModel>().updateHeader();
  }

  @override
  void didUpdateWidget(covariant Dashboard oldWidget) {
    super.didUpdateWidget(oldWidget);
    d('home didUpdateWidget at ${DateTime.now().toIso8601String()} ${widget != oldWidget}');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, ProfileViewModel profile, state) {
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: appBar(profile.userHeaderModel),
          body: StreamBuilder<HomeResponseModel>(
              stream: widget.viewModel.getStream(),
              builder: (context, AsyncSnapshot<HomeResponseModel> snapshot) {
                if (snapshot.hasError) {
                  String content = ErrorMessage.fromError(snapshot.error as Failure).message.toString();
                  d(content);
                  return Center(
                    child: Text(content),
                  );
                }
                if (snapshot.hasData && snapshot.data != null) {
                  final data = snapshot.requireData;
                  final _d = (data.dashboardResponse).data;
                  final _a = (data.attendanceResponse).data;
                  final List<ChartData> chartData = [
                    ChartData('Present', widget.utils.cast(_a?.totalPresent), Style.greenOutline),
                    ChartData('Leave', widget.utils.cast(_a?.totalLeave), Style.orangeOutline),
                    ChartData('Absent', widget.utils.cast(_a?.totalAbsent), Style.redOutline),
                  ];
                  return MainBody(
                    child: StaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount: 4,
                          mainAxisCellCount: 2.2,
                          child: SectionBox(
                            color: Style.card1,
                            padding: EdgeInsets.fromLTRB(
                                widget.dimens.k15, widget.dimens.k10, widget.dimens.kDefault, widget.dimens.k8),
                            shadow: true,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SectionBigTitleWithIcon(
                                      icon: const Icon(FontAwesomeIcons.calendarCheck, color: Style.title1),
                                      title: 'ATTENDANCE',
                                      subTitle: 'Overall Progress',
                                      titleStyle: context.textTheme.headline5?.copyWith(
                                          color: Style.title1,
                                          fontSize: widget.dimens.k18,
                                          fontWeight: FontWeight.w600),
                                      subtitleStyle: context.textTheme.bodyMedium,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SectionHorizontalWidget(
                                            firstWidget: CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Style.greenOutline,
                                              child: Icon(
                                                FontAwesomeIcons.check,
                                                color: Style.white,
                                                size: widget.dimens.k18,
                                              ),
                                            ),
                                            //  gap: 2,
                                            secondWidget: Text("${chartData[0].x} ${chartData[0].y}%",
                                                style: context.textTheme.bodyMedium?.copyWith(color: Style.textColor)),
                                          ),
                                          SectionHorizontalWidget(
                                            firstWidget: CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Style.orangeOutline,
                                              child: Icon(
                                                FontAwesomeIcons.clock,
                                                color: Style.white,
                                                size: widget.dimens.k18,
                                              ),
                                            ),
                                            //gap: 5,
                                            secondWidget: Text("${chartData[1].x} ${chartData[1].y}%",
                                                style: context.textTheme.bodyMedium?.copyWith(color: Style.textColor)),
                                          ),
                                          SectionHorizontalWidget(
                                            firstWidget: CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Style.redOutline,
                                              child: Icon(
                                                FontAwesomeIcons.xmark,
                                                color: Style.white,
                                                size: widget.dimens.k18,
                                              ),
                                            ),
                                            //  gap: 2,
                                            secondWidget: Text("${chartData[2].x} ${chartData[2].y}%",
                                                style: context.textTheme.bodyMedium?.copyWith(color: Style.textColor)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: SfCircularChart(annotations: <CircularChartAnnotation>[
                                    CircularChartAnnotation(
                                        angle: 90,
                                        widget: Text((_a?.overallAttendance ?? '0.0').toString() + '%',
                                            style: context.textTheme.bodyLarge))
                                  ], series: <CircularSeries>[
                                    DoughnutSeries<ChartData, String>(
                                      dataSource: chartData,
                                      xValueMapper: (ChartData data, _) => data.x,
                                      yValueMapper: (ChartData data, _) => data.y,
                                      pointColorMapper: (ChartData data, _) => data.color,
                                      innerRadius: '70%',
                                      radius: '100%',
                                    )
                                  ]),
                                ),
                              ],
                            ),
                          ).onTap(() {
                            widget.navigator.pushNamed(RoutePath.att, object: _a);
                          }),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 3,
                          child: SectionBox(
                            color: Style.card2,
                            padding: EdgeInsets.symmetric(vertical: widget.dimens.k10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SectionBigTitleWithIcon(
                                  icon: const Icon(FontAwesomeIcons.fileContract, color: Style.title2),
                                  title: 'Exam Result',
                                  subTitle: 'Overall Results',
                                  titleStyle: context.textTheme.headline5
                                      ?.copyWith(color: Style.title2, fontSize: 18, fontWeight: FontWeight.bold),
                                  subtitleStyle: context.textTheme.bodyMedium,
                                ),
                                widget.dimens.k25.verticalBoxPadding(),
                                Expanded(
                                  child: SfRadialGauge(
                                    enableLoadingAnimation: true,
                                    axes: <RadialAxis>[
                                      RadialAxis(
                                        minimum: 0,
                                        maximum: 100,
                                        showLabels: false,
                                        showTicks: false,
                                        radiusFactor: 0.9,
                                        annotations: <GaugeAnnotation>[
                                          GaugeAnnotation(
                                              angle: 90,
                                              axisValue: 5,
                                              positionFactor: 0.2,
                                              widget: Text((_d?.examResult).toString() + '%',
                                                  style: context.textTheme.bodyLarge))
                                        ],
                                        pointers: <GaugePointer>[
                                          RangePointer(
                                            value: widget.utils.cast(_d?.examResult),
                                            cornerStyle: CornerStyle.bothCurve,
                                            width: widget.dimens.k10,
                                            sizeUnit: GaugeSizeUnit.logicalPixel,
                                            color: Style.title2,
                                          ),
                                        ],
                                        axisLineStyle: AxisLineStyle(
                                            cornerStyle: CornerStyle.bothCurve,
                                            color: Style.title2.withOpacity(0.3),
                                            thickness: widget.dimens.k10),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ).onTap(() {
                            widget.navigator.pushNamed(RoutePath.examResult);
                          }),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 1.5,
                          child: SectionBox(
                            color: Style.card3,
                            padding: EdgeInsets.symmetric(vertical: widget.dimens.k10, horizontal: widget.dimens.k15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SectionBigTitleWithIcon(
                                  icon: const Icon(FontAwesomeIcons.user, color: Style.title3),
                                  title: 'Profile',
                                  titleStyle: context.textTheme.headline5
                                      ?.copyWith(color: Style.title3, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                widget.dimens.k25.verticalBoxPadding(),
                                Expanded(
                                  child: Text(
                                    /* widget.utils.compactText(_u?.name)*/
                                    profile.userHeaderModel.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textTheme.headline6
                                        ?.copyWith(fontWeight: FontWeight.w300, fontSize: widget.dimens.k15),
                                  ),
                                )
                              ],
                            ),
                          ).onTap(() {
                            profile.updateUserStream(true);
                            widget.navigator.pushNamed(RoutePath.profile);
                          }),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 1.5,
                          child: SectionBox(
                            color: Style.card4,
                            padding: EdgeInsets.symmetric(vertical: widget.dimens.k10, horizontal: widget.dimens.k15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SectionBigTitleWithIcon(
                                  icon: const Icon(FontAwesomeIcons.moneyBills, color: Style.title4),
                                  title: 'Fee',
                                  titleStyle: context.textTheme.headline5
                                      ?.copyWith(color: Style.title4, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                widget.dimens.k25.verticalBoxPadding(),
                                Expanded(
                                  child: SectionTitle(
                                    title: 'Fees Due',
                                    subTitle: widget.utils.symbolText(widget.utils.cast(_d?.feeDue), '(pkr)'),
                                    titleStyle: context.textTheme.bodySmall,
                                    subtitleStyle: context.textTheme.headline6
                                        ?.copyWith(color: Style.red, fontSize: widget.dimens.k18),
                                  ),
                                )
                              ],
                            ),
                          ).onTap(() {
                            widget.navigator.pushNamed(RoutePath.fee);
                          }),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 4,
                          mainAxisCellCount: 3.2,
                          child: SectionBox(
                            color: Style.card5,
                            padding: EdgeInsets.symmetric(vertical: widget.dimens.k10, horizontal: widget.dimens.k15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SectionBigTitleWithIcon(
                                  icon: const Icon(FontAwesomeIcons.calendarDays, color: Style.title5),
                                  title: 'Timetable',
                                  titleStyle: context.textTheme.headline5
                                      ?.copyWith(color: Style.title5, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                widget.dimens.k25.verticalBoxPadding(),
                                Expanded(
                                  child: StaggeredGrid.count(
                                    crossAxisCount: 5,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                    children: _d?.timetable
                                            ?.map((e) => StaggeredGridTile.count(
                                                crossAxisCellCount: 1,
                                                mainAxisCellCount: 1.5,
                                                child: TimeTableItem(
                                                  model: TimeTableModel(
                                                      start: widget.utils.compactText(e.timeCrud?.startTime),
                                                      end: widget.utils.compactText(e.timeCrud?.endTime),
                                                      sub: widget.utils.compactText(e.subject?.name)),
                                                )))
                                            .toList() ??
                                        [],
                                  ),
                                )
                              ],
                            ),
                          ).onTap(() {
                            widget.navigator.pushNamed(RoutePath.weeklyTimetable);
                          }),
                        ),
                        /*  StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.2,
                      child: SectionBox(
                        color: Style.card6,
                        padding: EdgeInsets.symmetric(vertical: widget.dimens.k10, horizontal: widget.dimens.k15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionTitle(
                              title: 'Gallery',
                              subTitle: 'Images',
                              titleStyle: context.textTheme.headline5
                                  ?.copyWith(color: Style.title6, fontSize: widget.dimens.k18, fontWeight: FontWeight.bold),
                              subtitleStyle: context.textTheme.bodyMedium,
                            ),
                            widget.dimens.k15.horizontalBoxPadding(),
                            SvgAssets.gallery
                          ],
                        ),
                      ).onTap(() {
                        widget.navigator.pushNamed(RoutePath.gallery);
                      }),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.2,
                      child: SectionBox(
                        color: Style.card7,
                        padding: EdgeInsets.symmetric(vertical: widget.dimens.k10, horizontal: widget.dimens.k15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionTitle(
                              title: 'About',
                              subTitle: 'Ummah College',
                              titleStyle: context.textTheme.headline5
                                  ?.copyWith(color: Style.title7, fontSize: widget.dimens.k18, fontWeight: FontWeight.bold),
                              subtitleStyle: context.textTheme.bodyMedium,
                            ),
                            Expanded(child: SvgAssets.aboutLogo)
                          ],
                        ),
                      ).onTap(() {
                        widget.navigator.pushNamed(RoutePath.about);
                      }),
                    ),*/
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        );
      },
    );
  }
}
