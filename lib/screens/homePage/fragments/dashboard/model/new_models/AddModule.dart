class AddModule {
  AddModule({
    this.totalDeposit,
    this.totalWithdraw,
    this.totalEquity,
    this.totalUnrealizedGainLoss,
    this.totalPurchasePower,
    this.totalCostValue,
  });

  AddModule.fromJson(dynamic json) {
    totalDeposit = json['total_deposit'];
    totalWithdraw = json['total_withdraw'];
    totalEquity = json['total_equity'];
    totalUnrealizedGainLoss = json['total_unrealized_gain_loss'];
    totalPurchasePower = json['total_purchase_power'];
    totalCostValue = json['total_cost_value'];
  }
  int? totalDeposit;
  int? totalWithdraw;
  double? totalEquity;
  double? totalUnrealizedGainLoss;
  double? totalPurchasePower;
  double? totalCostValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_deposit'] = totalDeposit;
    map['total_withdraw'] = totalWithdraw;
    map['total_equity'] = totalEquity;
    map['total_unrealized_gain_loss'] = totalUnrealizedGainLoss;
    map['total_purchase_power'] = totalPurchasePower;
    map['total_cost_value'] = totalCostValue;
    return map;
  }
}
