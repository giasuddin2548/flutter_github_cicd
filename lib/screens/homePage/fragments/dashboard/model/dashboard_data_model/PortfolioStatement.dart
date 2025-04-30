class PortfolioStatement {
  PortfolioStatement({
    this.nameOfFund,
    this.investmentType,
    this.unitHeld,
    this.unitSaleable,
    this.averageInvestmentAtCost,
    this.totalInvestmentAtCost,
    this.marketNavPrice,
    this.totalInvestmentAtMarket,
    this.unrealizeGain,
    this.unrealizeGainPercentage,
    this.jointInvestment,
    this.investorAccountId,
  });

  PortfolioStatement.fromJson(dynamic json) {
    nameOfFund = json['name_of_fund'];
    investmentType = json['investment_type'];
    unitHeld = json['unit_held'];
    unitSaleable = json['unit_saleable'];
    averageInvestmentAtCost = json['average_investment_at_cost'];
    totalInvestmentAtCost = json['total_investment_at_cost'];
    marketNavPrice = json['market_nav_price'];
    totalInvestmentAtMarket = json['total_investment_at_market'];
    unrealizeGain = json['unrealize_gain'];
    unrealizeGainPercentage = json['unrealize_gain_percentage'];
    jointInvestment = json['joint_investment'];
    investorAccountId = json['investor_account_id'];
  }
  String? nameOfFund;
  String? investmentType;
  String? unitHeld;
  String? unitSaleable;
  String? averageInvestmentAtCost;
  String? totalInvestmentAtCost;
  String? marketNavPrice;
  String? totalInvestmentAtMarket;
  String? unrealizeGain;
  String? unrealizeGainPercentage;
  String? jointInvestment;
  String? investorAccountId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name_of_fund'] = nameOfFund;
    map['investment_type'] = investmentType;
    map['unit_held'] = unitHeld;
    map['unit_saleable'] = unitSaleable;
    map['average_investment_at_cost'] = averageInvestmentAtCost;
    map['total_investment_at_cost'] = totalInvestmentAtCost;
    map['market_nav_price'] = marketNavPrice;
    map['total_investment_at_market'] = totalInvestmentAtMarket;
    map['unrealize_gain'] = unrealizeGain;
    map['unrealize_gain_percentage'] = unrealizeGainPercentage;
    map['joint_investment'] = jointInvestment;
    map['investor_account_id'] = investorAccountId;
    return map;
  }
}
