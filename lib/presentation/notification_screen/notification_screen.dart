import 'package:flutter/material.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/constant/Images/svgs.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/presentation/about_screen/mixin/about_mixin.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/notification_screen/mixin/notify_mixin.dart';
import 'package:ummah/presentation/widgets/main_body.dart';
import 'package:ummah/presentation/widgets/section_box.dart';

class NotificationScreen extends BaseStateFullWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> with NotificationMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(widget.dimens, widget.navigator),
      body: MainBody(
        scroll: true,
        extendedBottom: false,
        child: Column(
          children: List.generate(
              15,
                  (index) => SectionBox(
                width: context.width,
                height: 120,
                color: Style.card1,
                child: Center(
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.yellow,
                      ),

                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min ,
                        children:  [
                          Text(
                            'Unpaid Fee',
                            style: context.textTheme.titleLarge
                              ?.copyWith(color: Style.primary, fontWeight: FontWeight.bold),
                          ),
                          widget.dimens.k5.verticalBoxPadding(),
                          const Text(
                            'Pay your due fee',
                            style: TextStyle(fontSize: 14, color: Style.textColor),
                          ),
                          widget.dimens.k10.verticalBoxPadding(),
                          const Text(
                            '48 mins ago',
                            style: TextStyle(fontSize: 12, color: Style.fontGrey),
                          ),
                        ],
                      ),
                    )),
              )).toList(),
        )
      ),
    );
  }
}

