import 'package:rxdart/rxdart.dart';
import 'package:ummah/data/local_data_source/preference/i_pref_helper.dart';
import 'package:ummah/data/models/login_response.dart';
import 'package:ummah/di/di.dart';
import 'package:ummah/domain/entities/update_profile_entity.dart';
import 'package:ummah/domain/repo_interfaces/update_profile_interface.dart';
import 'package:ummah/domain/use_case/update_profile_usecase.dart';
import 'package:ummah/presentation/base/base_state.dart';
import 'package:ummah/presentation/base/base_view_model.dart';
import 'package:ummah/presentation/home/model/user_header_model.dart';
import 'package:ummah/presentation/profile_screen/enums/gender_enum.dart';

class ProfileViewModel extends BaseViewModel {
  late IPrefHelper prefHelper;

  late IUpdateProfile updateProfileRepo;
  final BehaviorSubject<LoginResponse> _loginSubject = BehaviorSubject<LoginResponse>();

  ProfileViewModel() {
    prefHelper = inject<IPrefHelper>();
    updateProfileRepo = inject<IUpdateProfile>();
  }

  UserHeaderModel _userHeaderModel = UserHeaderModel.empty();
  GenderEnum _genderEnum = GenderEnum.Male;
  DateTime _dateTime = DateTime(1992);
  BaseLoadingState _baseLoadingState = BaseLoadingState.none;


  BaseLoadingState get baseLoadingState => _baseLoadingState;

  set baseLoadingState(BaseLoadingState value) {
    _baseLoadingState = value;
    setState();
  }

  GenderEnum get genderEnum => _genderEnum;

  updateGenderEnum(GenderEnum value) {
    _genderEnum = value;
  }

  set genderEnum(GenderEnum value) {
    _genderEnum = value;
    setState();
  }

  DateTime get dateTime => _dateTime;

  updateDateTime(DateTime value) {
    _dateTime = value;
  }

  set dateTime(DateTime value) {
    _dateTime = value;
    setState();
  }

  LoginResponse? getUserFromLocal() {
    return prefHelper.retrieveUser();
  }

  Stream<LoginResponse> get loginSubject => _loginSubject.stream;

  updateProfile(UpdateProfileEntity updateProfileEntity) async {
    baseLoadingState = BaseLoadingState.loading;
    final _updateProfile = UpdateProfileUseCase(updateProfileRepo);
    final profile = await _updateProfile(updateProfileEntity);
    profile.fold((error) {
      baseLoadingState = BaseLoadingState.error;
      _loginSubject.sink.addError(error);
    }, (response) {
      baseLoadingState = BaseLoadingState.succeed;
      prefHelper.saveUser(response);
      updateHeader(local: false, notifyListeners: true, loginResponse: response);
      updateUserStream(false, loginResponse: response);
      navigator.pop();
    });
  }

  Future<void> updateUserStream(bool isLocal, {LoginResponse? loginResponse}) async {
    final response = isLocal ? getUserFromLocal()! : loginResponse;
    _loginSubject.sink.add(response!);
  }

  Future<void> updateHeader({bool local = true, bool notifyListeners = false, LoginResponse? loginResponse}) async {
    final response = local ? getUserFromLocal()! : loginResponse;
    _userHeaderModel = UserHeaderModel(
        name: utils.compactText(response?.data?.name), profile: utils.compactProfileUrl(response?.data?.profilePhoto));
    if (notifyListeners) {
      setState();
    }
  }

  UserHeaderModel get userHeaderModel => _userHeaderModel;
}
