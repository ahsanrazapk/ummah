class LoginEntity {
  String mobile;
  String password;

  LoginEntity({required this.mobile, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'mobile': mobile,
      'password': password,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginEntity && runtimeType == other.runtimeType && mobile == other.mobile && password == other.password;

  @override
  int get hashCode => mobile.hashCode ^ password.hashCode;
}