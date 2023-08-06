class User {
  String? token;
  // String? userName;

  User({this.token});

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    // userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    // data['userName'] = userName;
    return data;
  }
}