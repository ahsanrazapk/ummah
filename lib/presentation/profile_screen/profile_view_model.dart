import 'package:rxdart/rxdart.dart';
import 'package:ummah/data/local_data_source/preference/i_pref_helper.dart';
import 'package:ummah/data/models/login_response.dart';
import 'package:ummah/di/di.dart';
import 'package:ummah/presentation/base/base_view_model.dart';
import 'package:ummah/presentation/home/model/user_header_model.dart';
import 'package:ummah/presentation/profile_screen/enums/gender_enum.dart';
import 'package:ummah/presentation/utils/utils.dart';

class ProfileViewModel extends BaseViewModel {
  late IPrefHelper prefHelper;
  late Utils utils;
  final BehaviorSubject<LoginResponse> _loginSubject = BehaviorSubject<LoginResponse>();

  ProfileViewModel() {
    prefHelper = inject<IPrefHelper>();
    utils = inject<Utils>();
  }

  UserHeaderModel _userHeaderModel = UserHeaderModel.empty();
  GenderEnum _genderEnum = GenderEnum.Male;
  DateTime _dateTime = DateTime.now();

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

LoginResponse? getUserFromLocal()  {
    return prefHelper.retrieveUser();
  }


  Stream<LoginResponse> get loginSubject => _loginSubject.stream;

  Future<void> updateUserStream(bool isLocal,  {LoginResponse? loginResponse}) async {
    if(isLocal) {
      loginResponse = getUserFromLocal()!;
    }
    _loginSubject.sink.add(loginResponse!);
  }

 Future<void> updateHeader()async {
   final response = getUserFromLocal()!;
    userHeaderModel = UserHeaderModel(
        name: utils.compactText(response.data?.name), profile: utils.compactProfileUrl(response.data?.profilePhoto));
  }

  UserHeaderModel get userHeaderModel => _userHeaderModel;

  set userHeaderModel(UserHeaderModel value) {
    _userHeaderModel = value;
    setState();
  }
}
