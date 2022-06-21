class AccessData {
  String? login;
  String? password;
  String? userId;

  AccessData({this.login, this.password, this.userId}) {
    this.login = login;
    this.password = password;
    this.userId = userId;
  }

  AccessData.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    password = json['password'];
    userId = json['userId'];
  }

  Map<String, String?> toJson() {
    final data = <String, String?>{};
    data['login'] = this.login;
    data['password'] = this.password;
    data['userId'] = this.userId;

    return data;
  }
}
