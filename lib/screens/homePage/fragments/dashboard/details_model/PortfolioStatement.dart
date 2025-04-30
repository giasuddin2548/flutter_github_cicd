class PortfolioStatement {
  PortfolioStatement({
    this.investorAccountId,
    this.investorRegNo,
    this.nameOfFund,
    this.jointInvestment,
    this.investmentType,
    this.unitHeld,
    this.unitSaleable,
    this.averageInvestmentAtCost,
    this.totalInvestmentAtCost,
    this.marketNavPrice,
    this.totalInvestmentAtMarket,
    this.unrealizeGain,
    this.unrealizeGainPercentage,
    this.dividendType,
    this.asOnDate,
  });

  PortfolioStatement.fromJson(dynamic json) {
    investorAccountId = json['investor_account_id'];
    investorRegNo = json['investor_reg_no'];
    nameOfFund = json['name_of_fund'];
    jointInvestment = json['joint_investment'];
    investmentType = json['investment_type'];
    unitHeld = json['unit_held'];
    unitSaleable = json['unit_saleable'];
    averageInvestmentAtCost = json['average_investment_at_cost'];
    totalInvestmentAtCost = json['total_investment_at_cost'];
    marketNavPrice = json['market_nav_price'];
    totalInvestmentAtMarket = json['total_investment_at_market'];
    unrealizeGain = json['unrealize_gain'];
    unrealizeGainPercentage = json['unrealize_gain_percentage'];
    dividendType = json['dividend_type'];
    asOnDate = json['as_on_date'];
  }
  String? investorAccountId;
  String? investorRegNo;
  String? nameOfFund;
  String? jointInvestment;
  String? investmentType;
  String? unitHeld;
  String? unitSaleable;
  String? averageInvestmentAtCost;
  String? totalInvestmentAtCost;
  String? marketNavPrice;
  String? totalInvestmentAtMarket;
  String? unrealizeGain;
  String? unrealizeGainPercentage;
  String? dividendType;
  String? asOnDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['investor_account_id'] = investorAccountId;
    map['investor_reg_no'] = investorRegNo;
    map['name_of_fund'] = nameOfFund;
    map['joint_investment'] = jointInvestment;
    map['investment_type'] = investmentType;
    map['unit_held'] = unitHeld;
    map['unit_saleable'] = unitSaleable;
    map['average_investment_at_cost'] = averageInvestmentAtCost;
    map['total_investment_at_cost'] = totalInvestmentAtCost;
    map['market_nav_price'] = marketNavPrice;
    map['total_investment_at_market'] = totalInvestmentAtMarket;
    map['unrealize_gain'] = unrealizeGain;
    map['unrealize_gain_percentage'] = unrealizeGainPercentage;
    map['dividend_type'] = dividendType;
    map['as_on_date'] = asOnDate;
    return map;
  }
}
