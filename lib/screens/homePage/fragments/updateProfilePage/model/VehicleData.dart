class VehicleData {
  VehicleData({this.portfolioid, this.portfolioname});

  VehicleData.fromJson(dynamic json) {
    portfolioid = json['PORTFOLIO_ID'];
    portfolioname = json['PORTFOLIO_NAME'];
  }
  int? portfolioid;
  String? portfolioname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PORTFOLIO_ID'] = portfolioid;
    map['PORTFOLIO_NAME'] = portfolioname;
    return map;
  }
}
