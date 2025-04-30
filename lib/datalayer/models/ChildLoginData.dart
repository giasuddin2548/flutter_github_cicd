class ChildLoginData {
  ChildLoginData({this.portfolioCode});

  ChildLoginData.fromJson(dynamic json) {
    portfolioCode = json['portfolio_code'];
  }
  String? portfolioCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['portfolio_code'] = portfolioCode;
    return map;
  }
}
