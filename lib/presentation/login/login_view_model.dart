import 'package:flutter/material.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/core/result.dart';
import 'package:ummah/application/network/error_handler/error_handler.dart';
import 'package:ummah/data/local_data_source/preference/i_pref_helper.dart';
import 'package:ummah/data/models/login_response.dart';
import 'package:ummah/di/di.dart';
import 'package:ummah/domain/entities/login_entity.dart';
import 'package:ummah/domain/repo_interfaces/login_interface.dart';
import 'package:ummah/domain/use_case/login_usecase.dart';
import 'package:ummah/presentation/base/base_view_model.dart';
import 'package:ummah/presentation/login/enums/login_state.dart';

class LoginViewModel extends BaseViewModel {
  late ILogin _repo;
  late IPrefHelper _prefHelper;
  LoginState _state  = LoginState.none;

  LoginViewModel() {
    _repo = inject<ILogin>();
    _prefHelper = inject<IPrefHelper>();
  }


  LoginState get state => _state;

   updateState(LoginState value) {
    _state = value;
    setState();
  }

  Future<void> login(LoginEntity params, Result<LoginResponse> result) async {
    updateState(LoginState.loading);
    final _login = LoginUseCase(_repo);
    final loginUser = await _login(params);
    loginUser.fold((error) {
      result.onError(error);
      return;
    }, (response) {
      _prefHelper.saveToken(response.data?.accessToken);
      _prefHelper.saveUser(response);
      result.onSuccess(response);
      return;
    });
  }
}
