import 'package:flutter/material.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/application/core/routes/routes.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/data/models/login_response.dart';
import 'package:ummah/domain/entities/update_profile_entity.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/profile_screen/component/sliver_app_bar_section.dart';
import 'package:ummah/presentation/profile_screen/enums/gender_enum.dart';
import 'package:ummah/presentation/profile_screen/model/profile_model.dart';
import 'package:ummah/presentation/widgets/big_btn.dart';
import 'package:ummah/presentation/widgets/section_box.dart';
import 'package:ummah/presentation/widgets/section_text_field_with_decor.dart';
import 'package:ummah/presentation/widgets/section_vertical_widget.dart';

class EditProfileScreen extends BaseStateFullWidget {
 final  LoginData?  loginData;
  EditProfileScreen({Key? key, this.loginData}) : super(key: key);

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  LoginData? get loginData => widget.loginData;
 late UpdateProfileEntity updateProfileEntity;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller.forward();
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
   updateProfileEntity  = UpdateProfileEntity.fromJson(loginData?.toJson() ?? {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedBuilder(
        builder: (BuildContext context, Widget? child) => child!,
        animation: controller,
        child: ClipPath(
          clipper: MyClipper(controller.value),
          child: Material(
            child: CustomScrollView(
              primary: true,
              slivers: [
                SliverPersistentHeader(
                  delegate: MySliverAppBar(expandedHeight: 250, actionDone: true,loginData: loginData!),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Stack(
                      children: [
                        SectionBox(
                            color: Style.card1.withOpacity(0.4),
                            width: context.width,
                            height: context.height + context.getHeight(0.08),
                            border: true,
                            borderColor: Style.card1.withOpacity(0.7),
                            margin: EdgeInsets.symmetric(horizontal: widget.dimens.k10),
                            padding: const EdgeInsets.all(8.0),
                            child: Container()),
                        Padding(
                          padding: EdgeInsets.all(widget.dimens.k20),
                          child: Column(
                            children: [
                              Text(
                                'Personal Information',
                                style: context.textTheme.headline6
                                    ?.copyWith(color: Style.primary, fontWeight: FontWeight.normal),
                              ),
                              widget.dimens.k10.verticalBoxPadding(),
                              ...List<ProfileModel>.from(<ProfileModel>[
                                ProfileModel(
                                    name: 'Name:',
                                    value: widget.utils.compactText(updateProfileEntity.name),
                                    controller: TextEditingController()),
                                ProfileModel(
                                    name: 'CNIC:',
                                    value: widget.utils.compactText(updateProfileEntity.cnic),
                                    controller: TextEditingController()),
                                ProfileModel(
                                    name: 'Gender:',
                                    value: widget.utils
                                        .compactEnumText<GenderEnum>(
                                        updateProfileEntity.gender.toString().toInt(), GenderEnum.values)
                                        .name,
                                    controller: TextEditingController()),
                                ProfileModel(
                                    name: 'DOB:',
                                    value: widget.utils.compactText(updateProfileEntity.dateOfBirth),
                                    controller: TextEditingController()),
                                ProfileModel(
                                    name: 'Address:',
                                    value: widget.utils.compactText(updateProfileEntity.address),
                                    controller: TextEditingController()),
                              ])
                                  .map((e) => Padding(
                                        padding: EdgeInsets.all(widget.dimens.k5),
                                        child: SectionVerticalWidget(
                                          firstWidget: Text(
                                            e.name,
                                            style: context.textTheme.labelLarge
                                                ?.copyWith(color: Style.primary, fontWeight: FontWeight.normal),
                                          ),
                                          secondWidget: SectionTextFieldDecor(
                                            hintText: e.isLabelShow(),
                                            controller: e.isValueAvailAble(),
                                            readOnly: false,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              context.getHeight(0.05).verticalBoxPadding(),
                              BigBtn(
                                onTap: () {},
                                child: const Text('UPDATE'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
