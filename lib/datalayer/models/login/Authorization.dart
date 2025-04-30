class Authorization {
  Authorization({this.token, this.parentToken, this.type});

  Authorization.fromJson(dynamic json) {
    token = json['token'];
    parentToken = json['parentToken'];
    type = json['type'];
  }
  String? token;
  String? parentToken;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['parentToken'] = parentToken;
    map['type'] = type;
    return map;
  }
}
