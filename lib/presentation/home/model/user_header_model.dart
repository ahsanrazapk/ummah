class UserHeaderModel {

  String name;
  String profile;

  UserHeaderModel({required this.name, required this.profile});

  UserHeaderModel.empty({this.name = '-', this.profile =  'https://via.placeholder.com/250x250'});
}