class LoginData {
  int? status;
  String? message;
  User? user;
  String? accessToken;

  LoginData({this.status, this.message, this.user, this.accessToken});

  LoginData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['access_token'] = this.accessToken;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['employee_id'] = this.employeeId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
