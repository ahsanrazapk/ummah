import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/main_config/routes/route_path.dart';
import 'package:ummah/application/network/error_handler/error_handler.dart';
import 'package:ummah/common/logger/log.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/data/local_data_source/preference/i_pref_helper.dart';
import 'package:ummah/data/models/login_response.dart';
import 'package:ummah/di/di.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/profile_screen/component/sliver_app_bar_section.dart';
import 'package:ummah/presentation/profile_screen/enums/gender_enum.dart';
import 'package:ummah/presentation/profile_screen/model/profile_model.dart';
import 'package:ummah/presentation/profile_screen/profile_view_model.dart';
import 'package:ummah/presentation/widgets/big_btn.dart';
import 'package:ummah/presentation/widgets/section_box.dart';
import 'package:ummah/presentation/widgets/section_horizontal_widget.dart';
import 'package:ummah/presentation/widgets/section_text_field_with_decor.dart';



class ProfileScreen extends BaseStateFullWidget {

  ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   final viewModel =  context.watch<ProfileViewModel>();
    return StreamBuilder(
      stream: viewModel.loginSubject,
      builder: (context, AsyncSnapshot<LoginResponse> snapshot) {

        if (snapshot.hasError) {
          String content = ErrorMessage.fromError(snapshot.error as Failure).message.toString();
          d(content);
          return Center(
            child: Text(content),
          );
        }
        if (snapshot.hasData && snapshot.data != null) {
          final data = snapshot.requireData;
          final loginData = data.data;
          return SafeArea(
            child: Material(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: [
                  SliverPersistentHeader(
                    delegate: MySliverAppBar(expandedHeight: 250, actionDone: false, loginData: loginData!),
                    pinned: true,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Stack(
                        children: [
                          SectionBox(
                              color: Style.card1.withOpacity(0.4),
                              width: context.width,
                              height: context.height + context.getHeight(0.35),
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
                                      name: 'Roll No:',
                                      value: widget.utils.compactText(loginData.rollNo),
                                      controller: TextEditingController()),
                                  ProfileModel(
                                      name: 'CNIC:',
                                      value: widget.utils.compactText(loginData.cnic),
                                      controller: TextEditingController()),
                                  ProfileModel(
                                      name: 'Gender:',
                                      value: widget.utils
                                          .compactEnumText<GenderEnum>(
                                          loginData.gender.toString().toInt(), GenderEnum.values)
                                          .name,
                                      controller: TextEditingController()),
                                  ProfileModel(
                                      name: 'DOB:',
                                      value: widget.utils.compactText(loginData.dateOfBirth),
                                      controller: TextEditingController()),
                                  ProfileModel(
                                      name: 'Campus:',
                                      value: widget.utils.compactText(loginData.campus?.name),
                                      controller: TextEditingController()),
                                  ProfileModel(
                                      name: 'Section:',
                                      value: widget.utils.compactText(loginData.section?.name),
                                      controller: TextEditingController()),
                                  ProfileModel(
                                      name: 'Address:',
                                      value: widget.utils.compactText(loginData.address),
                                      controller: TextEditingController()),
                                  ProfileModel(
                                      name: 'Contact No:',
                                      value: widget.utils.compactText(loginData.mobile),
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
                                  padding:  EdgeInsets.all(widget.dimens.k15),
                                  child: Text(
                                    'Guardian Information',
                                    style: context.textTheme.headline6
                                        ?.copyWith(color: Style.primary, fontWeight: FontWeight.normal),
                                  ),
                                ),
                                ...List<ProfileModel>.from(<ProfileModel>[
                                  ProfileModel(
                                      name: 'Father Name:',
                                      value: widget.utils.compactText(loginData.fatherName),
                                      controller: TextEditingController()),
                                  ProfileModel(
                                      name: 'Father CNIC:',
                                      value: widget.utils.compactText(loginData.fatherCnic),
                                      controller: TextEditingController()),
                                  ProfileModel(
                                      name: 'Occupation:',
                                      value: widget.utils.compactText(loginData.fatherOccupation),
                                      controller: TextEditingController()),
                                  ProfileModel(
                                      name: 'Contact No:',
                                      value: widget.utils.compactText(loginData.fatherMobile),
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
                                    onTap: () async {
                                      bool? logout = await widget.navigator.showNAVDialog('Are you sure?', 'You want to go back');

                                      if(logout!=null && logout){
                                        inject<IPrefHelper>().removeToken();
                                        widget.navigator.pushNamedAndRemoveUntil(RoutePath.login);
                                      }
                                    },
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }






      }
    );
  }
}
