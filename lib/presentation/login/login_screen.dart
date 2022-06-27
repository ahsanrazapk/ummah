import 'package:flutter/material.dart';
import 'package:ummah/application/network/error_handler/error_handler.dart';
import 'package:ummah/common/logger/log.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/data/local_data_source/preference/i_pref_helper.dart';
import 'package:ummah/data/models/login_response.dart';
import 'package:ummah/di/di.dart';
import 'package:ummah/application/main_config/routes/route_path.dart';
import 'package:ummah/domain/entities/login_entity.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/home/home_view_model.dart';
import 'package:ummah/presentation/login/enums/login_state.dart';
import 'package:ummah/presentation/widgets/big_btn.dart';
import 'package:ummah/presentation/widgets/section_text_field.dart';
import 'package:ummah/presentation/widgets/section_title.dart';
import 'package:ummah/constant/Images/svgs.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/core/result.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/presentation/login/login_view_model.dart';
import 'package:provider/provider.dart';
import 'mixin/login_mixin.dart';

class LoginScreen extends BaseStateFullWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> with LoginMixin implements Result<LoginResponse> {
  late IPrefHelper pref;

  @override
  void initState() {
    pref = inject<IPrefHelper>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.width,
          height: context.height,
          child: Padding(
            padding: EdgeInsets.fromLTRB(widget.dimens.k15, kToolbarHeight, widget.dimens.k15, widget.dimens.k25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgAssets.appLogoBlue,
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(
                        title: 'Proceed with your',
                        subTitle: 'Login',
                        titleStyle: context.textTheme.bodySmall,
                        subtitleStyle: context.textTheme.headline5?.copyWith(color: Style.primary),
                      ),
                      context.getHeight(0.03).verticalBoxPadding(),
                      SectionTextField(
                        key: idKey,
                        hintText: 'Student ID',
                        controller: idController,
                        validator: (input) => input!.isEmpty
                            ? 'Required Field' : null,
                        onChanged: (input) {
                          //d('Student Id: $input');
                        },
                      ),
                      context.getHeight(0.03).verticalBoxPadding(),
                      SectionTextField(
                        key: passKey,
                        obscureText: true,
                        hintText: 'Password',
                        controller: passController,
                        validator: (input) => input!.isEmpty ? 'Required Field' : input.length < 6
                            ? 'Password must be minimum 6 character' : null,
                        onChanged: (input) {
                          //d('Password: $input');
                        },
                      )
                    ],
                  ),
                ),
                loginButton(viewModel.state),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(LoginState state) {
    switch (state) {
      case LoginState.none:
      case LoginState.error:
      case LoginState.succeed:
        return BigBtn(
          onTap: () async {
            if (validate) {
              await context
                  .read<LoginViewModel>()
                  .login(LoginEntity(mobile: idController.text, password: passController.text), this);
            }
          },
          child: const Text('Login'),
        );
      case LoginState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }

  @override
  onError(Failure error) {
    String _error = ErrorMessage.fromError(error).message.toString();
    d(_error);
    context.read<LoginViewModel>().updateState(LoginState.error);
    widget.navigator.showNAVDialog('Error', _error, dismissOnly: true);
  }

  @override
  onSuccess(LoginResponse result) async {
    d(result.message!);
   await context.read<HomeViewModel>().getDashboard();
   await context.read<HomeViewModel>().getAttendance();
    context.read<LoginViewModel>().updateState(LoginState.succeed);
    widget.navigator.pushNamedAndRemoveUntil(RoutePath.home);
  }
}
