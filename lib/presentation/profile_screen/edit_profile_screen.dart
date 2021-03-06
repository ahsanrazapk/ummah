import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/application/core/routes/routes.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/data/models/login_response.dart';
import 'package:ummah/domain/entities/update_profile_entity.dart';
import 'package:ummah/presentation/base/base_state.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/profile_screen/component/RadioButton.dart';
import 'package:ummah/presentation/profile_screen/component/dob/CustomPicker.dart';
import 'package:ummah/presentation/profile_screen/component/dob/datetime_picker.dart';
import 'package:ummah/presentation/profile_screen/component/sliver_app_bar_section.dart';
import 'package:ummah/presentation/profile_screen/enums/gender_enum.dart';
import 'package:ummah/presentation/profile_screen/model/profile_model.dart';
import 'package:ummah/presentation/profile_screen/profile_view_model.dart';
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
 List<ProfileModel> personalInfo = [];
 List<ProfileModel> guardianInfo = [];

  @override
  void initState() {

   final viewModel  =  context.read<ProfileViewModel>();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller.forward();
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
   updateProfileEntity  = UpdateProfileEntity.fromJson(loginData?.toJson() ?? {});
   viewModel.updateDateTime(DateFormat('dd-MM-yyyy').parse(updateProfileEntity.dateOfBirth!));
   viewModel.updateGenderEnum(widget.utils
       .compactEnumText<GenderEnum>(
       updateProfileEntity.gender, GenderEnum.values));

    personalInfo =  [
      ProfileModel(
        readOnly: false,
          name: 'Name:',
          controller: TextEditingController(text: widget.utils.compactEmptyText(updateProfileEntity.name))),
      ProfileModel(
        readOnly: false,
          name: 'CNIC:',
          controller: TextEditingController(text: widget.utils.compactEmptyText(updateProfileEntity.cnic))),
      ProfileModel(
          name: 'Gender:',
         value:   context.read<ProfileViewModel>().genderEnum.name),
      ProfileModel(
        readOnly: true,
          onTap: (){
            pickDate();
          },
          name: 'DOB:',
          controller: TextEditingController(text: widget.utils.compactEmptyText(updateProfileEntity.dateOfBirth))),
      ProfileModel(
        readOnly: false,
          name: 'Address:',
          controller: TextEditingController(text: widget.utils.compactEmptyText(updateProfileEntity.address))),
    ];
    guardianInfo =[
      ProfileModel(
        readOnly: false,
          name: 'Father Name:',
          controller: TextEditingController(text: widget.utils.compactEmptyText(loginData?.fatherName),)),
      ProfileModel(
        readOnly: false,
          name: 'Father CNIC:',
          controller: TextEditingController(text: widget.utils.compactEmptyText(loginData?.fatherCnic),)),
      ProfileModel(
        readOnly: false,
          name: 'Occupation:',
          controller: TextEditingController(text: widget.utils.compactEmptyText(loginData?.fatherOccupation),)),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel =  context.watch<ProfileViewModel>();

    return SafeArea(
      child: AnimatedBuilder(
        builder: (BuildContext context, Widget? child) => child!,
        animation: controller,
        child: ClipPath(
          clipper: MyClipper(controller.value),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                SliverPersistentHeader(
                  delegate: MySliverAppBar(expandedHeight: 250, actionDone: true,loginData: loginData!),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SectionBox(
                            color: Style.card1.withOpacity(0.4),
                            width: context.width,
                            height: context.height + ((context.getHeight(0.3))),
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
                              ...personalInfo.map((e) => Padding(
                                        padding: EdgeInsets.all(widget.dimens.k5),
                                        child: SectionVerticalWidget(
                                          firstWidget: Text(
                                            e.name,
                                            style: context.textTheme.labelLarge
                                                ?.copyWith(color: Style.primary, fontWeight: FontWeight.normal),
                                          ),
                                          secondWidget: e.name == 'Gender:' ?Row(
                                              children: GenderEnum.values.map((e) =>   RadioButton(genderEnum: e),).toList()
                                          )  :SectionTextFieldDecor(
                                            hintText: Constants.notAvailable,
                                            controller: e.controller,
                                            readOnly: e.readOnly,
                                            onTap: e.onTap,
                                          ),
                                        ),
                                      )).toList(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Guardian Information',
                                  style: context.textTheme.headline6
                                      ?.copyWith(color: Style.primary, fontWeight: FontWeight.normal),
                                ),
                              ),
                              ...guardianInfo.map((e) => Padding(
                                padding: EdgeInsets.all(widget.dimens.k5),
                                child: SectionVerticalWidget(
                                  firstWidget: Text(
                                    e.name,
                                    style: context.textTheme.labelLarge
                                        ?.copyWith(color: Style.primary, fontWeight: FontWeight.normal),
                                  ),
                                  secondWidget: SectionTextFieldDecor(
                                    hintText: Constants.notAvailable,
                                    controller: e.controller,
                                    readOnly: e.readOnly,
                                    onTap: e.onTap,
                                  ),
                                ),
                              ))
                                  .toList(),
                              Padding(
                                padding:  EdgeInsets.only(top: widget.dimens.k12),
                                child: updateButton(viewModel.baseLoadingState),
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

  Widget updateButton(BaseLoadingState state) {
    switch (state) {
      case BaseLoadingState.none:
      case BaseLoadingState.error:
      case BaseLoadingState.succeed:
        return BigBtn(
          onTap: () async {
            updateProfileEntity.name = personalInfo[0].controller?.text;
            updateProfileEntity.cnic = personalInfo[1].controller?.text;
            updateProfileEntity.gender =  context.read<ProfileViewModel>().genderEnum.index;
            updateProfileEntity.dateOfBirth = personalInfo[3].controller?.text;
            updateProfileEntity.address = personalInfo[4].controller?.text;
            updateProfileEntity.fatherName = guardianInfo[0].controller?.text;
            updateProfileEntity.fatherCnic = guardianInfo[1].controller?.text;
            updateProfileEntity.fatherOccupation = guardianInfo[2].controller?.text;
            context.read<ProfileViewModel>().updateProfile(updateProfileEntity);
          },
          child: const Text('UPDATE'),
        );
      case BaseLoadingState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }

  pickDate() {
    DatePicker.showPicker(context,
        onChanged: (date) {}, onConfirm: (date) {
        personalInfo[3].controller?.text =   DateFormat('dd-MM-yyyy').format(date);
    }, onCancel: () {}, pickerModel: CustomPicker(currentTime: context.read<ProfileViewModel>().dateTime));
  }
}
