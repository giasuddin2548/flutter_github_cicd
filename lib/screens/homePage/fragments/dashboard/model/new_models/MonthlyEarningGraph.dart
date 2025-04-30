class MonthlyEarningGraph {
  MonthlyEarningGraph({
    this.currentDeposit,
    this.withdraw,
    this.equity,
    this.purchasePower,
    this.costValueSecurities,
    this.marketValueSecurities,
    this.unrealizeGainLoss,
    this.currentAssetLiabilities,
  });

  MonthlyEarningGraph.fromJson(dynamic json) {
    currentDeposit = json['current_deposit'];
    withdraw = json['withdraw'];
    equity = json['equity'];
    purchasePower = json['purchase_power'];
    costValueSecurities = json['cost_value_securities'];
    marketValueSecurities = json['market_value_securities'];
    unrealizeGainLoss = json['unrealize_gain_loss'];
    currentAssetLiabilities = json['current_asset_liabilities'];
  }
  String? currentDeposit;
  String? withdraw;
  String? equity;
  String? purchasePower;
  String? costValueSecurities;
  String? marketValueSecurities;
  String? unrealizeGainLoss;
  String? currentAssetLiabilities;
}
