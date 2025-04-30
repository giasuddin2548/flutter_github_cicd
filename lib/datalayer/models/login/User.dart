class User {
  User({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.mobileNo,
    this.investorCode,
    this.createdAt,
    this.updatedAt,
    this.enabled,
    this.authType,
    this.confirmed,
    this.confirmationCode,
    this.type,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    investorCode = json['investor_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    enabled = json['enabled'];
    authType = json['auth_type'];
    confirmed = json['confirmed'];
    confirmationCode = json['confirmation_code'];
    type = json['type'];
    trade_code = json['trade_code'];
  }
  int? id;
  dynamic name;
  dynamic firstName;
  dynamic lastName;
  dynamic username;
  String? email;
  String? mobileNo;
  String? investorCode;
  String? createdAt;
  String? updatedAt;
  String? enabled;
  dynamic authType;
  String? confirmed;
  dynamic confirmationCode;
  String? type;
  String? trade_code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['username'] = username;
    map['email'] = email;
    map['mobile_no'] = mobileNo;
    map['investor_code'] = investorCode;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['enabled'] = enabled;
    map['auth_type'] = authType;
    map['confirmed'] = confirmed;
    map['confirmation_code'] = confirmationCode;
    map['type'] = type;
    map['trade_code'] = trade_code;
    return map;
  }
}
