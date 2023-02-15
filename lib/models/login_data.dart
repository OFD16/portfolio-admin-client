class LoginData {
  String? signMail;
  String? password;

  LoginData({this.signMail, this.password});

  Map<String, dynamic> toJson() {
    return {
      'sign_mail': signMail,
      'password': password
    };
  }
}