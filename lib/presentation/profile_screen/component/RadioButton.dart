import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/profile_screen/enums/gender_enum.dart';
import 'package:ummah/presentation/profile_screen/profile_view_model.dart';
import 'package:ummah/presentation/widgets/section_horizontal_widget.dart';

class RadioButton extends BaseStateLessWidget {
  final GenderEnum genderEnum;
   RadioButton({Key? key, required this.genderEnum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final viewModel =  context.watch<ProfileViewModel>();
    return SectionHorizontalWidget(
     firstWidget:    Radio<GenderEnum>(
       activeColor:Style.primary,
       value: genderEnum,
       groupValue: viewModel.genderEnum,
       onChanged: (value){
         viewModel.genderEnum = value!;
       },
     ),
      secondWidget:Text(genderEnum.name),

    );
  }
}
