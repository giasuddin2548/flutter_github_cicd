class PortfolioPerformance {
  PortfolioPerformance({this.instrumentName, this.avgRate, this.marketPrice});

  PortfolioPerformance.fromJson(dynamic json) {
    instrumentName = json['instrument_name'];
    avgRate = json['avg_rate'];
    marketPrice = json['market_price'];
  }
  String? instrumentName;
  String? avgRate;
  String? marketPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['instrument_name'] = instrumentName;
    map['avg_rate'] = avgRate;
    map['market_price'] = marketPrice;
    return map;
  }
}
