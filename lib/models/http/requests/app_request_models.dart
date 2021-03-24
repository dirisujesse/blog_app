class LoginData {
  String email;
  String password;

  LoginData({this.email, this.password});

  Map<String, dynamic> get json {
    return {
      "email": email,
      "password": password,
    };
  }
}