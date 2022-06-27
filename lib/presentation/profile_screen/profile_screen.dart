import 'package:flutter/material.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/data/models/login_response.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/profile_screen/component/sliver_app_bar_section.dart';
import 'package:ummah/presentation/profile_screen/enums/gender_enum.dart';
import 'package:ummah/presentation/profile_screen/model/profile_model.dart';
import 'package:ummah/presentation/widgets/big_btn.dart';
import 'package:ummah/presentation/widgets/section_box.dart';
import 'package:ummah/presentation/widgets/section_horizontal_widget.dart';
import 'package:ummah/presentation/widgets/section_text_field_with_decor.dart';



class ProfileScreen extends BaseStateFullWidget {
  final LoginData? loginResponse;

  ProfileScreen({Key? key, this.loginResponse}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  get loginResponse => widget.loginResponse;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(expandedHeight: 255, actionDone: false, loginData: loginResponse),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Stack(
                  children: [
                    SectionBox(
                        color: Style.card1.withOpacity(0.4),
                        width: context.width,
                        height: context.height + 150,
                        border: true,
                        borderColor: Style.card1.withOpacity(0.7),
                        margin: EdgeInsets.symmetric(horizontal: widget.dimens.k10),
                        padding: const EdgeInsets.all(8.0),
                        child: const SizedBox.shrink()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Personal Information',
                              style: context.textTheme.headline6
                                  ?.copyWith(color: Style.primary, fontWeight: FontWeight.normal),
                            ),
                          ),
                          ...List<ProfileModel>.from(<ProfileModel>[
                            ProfileModel(
                                name: 'CNIC:',
                                value: widget.utils.compactText(widget.loginResponse?.cnic),
                                controller: TextEditingController()),
                            ProfileModel(
                                name: 'Gender:',
                                value: widget.utils
                                    .compactEnumText<GenderEnum>(
                                        widget.loginResponse?.gender.toString().toInt(), GenderEnum.values)
                                    .name,
                                controller: TextEditingController()),
                            ProfileModel(
                                name: 'DOB:',
                                value: widget.utils.compactText(widget.loginResponse?.dateOfBirth),
                                controller: TextEditingController()),
                            ProfileModel(
                                name: 'Campus:',
                                value: widget.utils.compactText(widget.loginResponse?.campus?.name),
                                controller: TextEditingController()),
                            ProfileModel(
                                name: 'Section:',
                                value: widget.utils.compactText(widget.loginResponse?.section?.name),
                                controller: TextEditingController()),
                            ProfileModel(
                                name: 'Address:',
                                value: widget.utils.compactText(widget.loginResponse?.address),
                                controller: TextEditingController()),
                            ProfileModel(
                                name: 'Contact No:',
                                value: widget.utils.compactText(widget.loginResponse?.mobile),
                                controller: TextEditingController())
                          ])
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SectionHorizontalWidget(
                                      firstWidget: SizedBox(
                                          width: context.getWidth(0.3),
                                          child: Text(
                                            e.name,
                                            style: context.textTheme.labelLarge
                                                ?.copyWith(color: Style.primary, fontWeight: FontWeight.normal),
                                          )),
                                      secondWidget: Expanded(
                                        child: SizedBox(
                                          width: context.getWidth(0.7),
                                          child: SectionTextFieldDecor(
                                            hintText: e.isLabelShow(),
                                            controller: e.isValueAvailAble(),
                                            readOnly: true,
                                          ),
                                        ),
                                      ),
                                      gap: 1,
                                    ),
                                  ))
                              .toList(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Guardian Information',
                              style: context.textTheme.headline6
                                  ?.copyWith(color: Style.primary, fontWeight: FontWeight.normal),
                            ),
                          ),
                          ...List<ProfileModel>.from(<ProfileModel>[
                            ProfileModel(
                                name: 'Father Name:',
                                value: widget.utils.compactText(widget.loginResponse?.fatherName),
                                controller: TextEditingController()),
                            ProfileModel(
                                name: 'Father CNIC:',
                                value: widget.utils.compactText(widget.loginResponse?.fatherCnic),
                                controller: TextEditingController()),
                            ProfileModel(
                                name: 'Occupation:',
                                value: widget.utils.compactText(widget.loginResponse?.fatherOccupation),
                                controller: TextEditingController()),
                            ProfileModel(
                                name: 'Contact No:',
                                value: widget.utils.compactText(widget.loginResponse?.fatherMobile),
                                controller: TextEditingController()),
                          ])
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SectionHorizontalWidget(
                                      firstWidget: SizedBox(
                                          width: context.getWidth(0.3),
                                          child: Text(
                                            e.name,
                                            style: context.textTheme.labelLarge
                                                ?.copyWith(color: Style.primary, fontWeight: FontWeight.normal),
                                          )),
                                      secondWidget: Expanded(
                                        child: SizedBox(
                                          width: context.getWidth(0.7),
                                          child: SectionTextFieldDecor(
                                            hintText: e.isLabelShow(),
                                            controller: e.isValueAvailAble(),
                                            readOnly: true,
                                          ),
                                        ),
                                      ),
                                      gap: 1,
                                    ),
                                  ))
                              .toList(),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: BigBtn(
                              onTap: () {},
                              buttonStyle: Style.of(context)
                                  .defaultButtonStyle()
                                  .copyWith(backgroundColor: MaterialStateProperty.all<Color>(Style.lightRed)),
                              child: const Text('LOG OUT'),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
