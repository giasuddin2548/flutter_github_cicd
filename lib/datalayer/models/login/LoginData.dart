class LoginData {
  int? status;
  String? message;
  User? user;
  String? accessToken;

  LoginData({this.status, this.message, this.user, this.accessToken});

  LoginData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['access_token'] = accessToken;
    return data;
  }
}

class User {
  int? userId;
  int? employeeId;
  String? name;
  String? phone;
  String? profileImage;

  User({
    this.userId,
    this.employeeId,
    this.name,
    this.phone,
    this.profileImage,
  });

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    employeeId = json['employee_id'];
    name = json['name'];
    phone = json['phone'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['employee_id'] = employeeId;
    data['name'] = name;
    data['phone'] = phone;
    data['profile_image'] = profileImage;
    return data;
  }
}
