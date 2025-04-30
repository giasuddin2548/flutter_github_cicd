class SectorWiseInvestment {
  SectorWiseInvestment({
    this.sectorName,
    this.marketValueSecurities,
    this.costValueSecurities,
  });

  SectorWiseInvestment.fromJson(dynamic json) {
    sectorName = json['sector_name'];
    marketValueSecurities = json['market_value_securities'];
    costValueSecurities = json['cost_value_securities'];
  }
  String? sectorName;
  String? marketValueSecurities;
  String? costValueSecurities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sector_name'] = sectorName;
    map['market_value_securities'] = marketValueSecurities;
    map['cost_value_securities'] = costValueSecurities;
    return map;
  }
}
