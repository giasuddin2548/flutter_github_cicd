class InvestorAccountDetailsSummury {
  InvestorAccountDetailsSummury({
    this.investmentTypeId,
    this.investmentStyle,
    this.dividendType,
    this.installmentTenure,
    this.installmentDate,
    this.installmentSize,
    this.fundDeposit,
    this.dividendReinvested,
    this.totalDeposit,
    this.totalWithdrawal,
    this.unitsPurchasedNos,
    this.cipUnitsNos,
    this.unitsSurrenderNos,
    this.unitsHeld,
    this.averageCostPriceByUnit,
    this.investmentAtCost,
    this.currentNav,
    this.currentNavDate,
    this.marketValueOfInvestment,
    this.capitalGainRealize,
    this.capitalGainUnrealize,
    this.totalCapitalGain,
    this.dividendIncome,
    this.totalReturn,
    this.cashBalance,
  });

  InvestorAccountDetailsSummury.fromJson(dynamic json) {
    investmentTypeId = json['investment_type_id'];
    investmentStyle = json['investment_style'];
    dividendType = json['dividend_type'];
    installmentTenure = json['installment_tenure'];
    installmentDate = json['installment_date'];
    installmentSize = json['installment_size'];
    fundDeposit = json['fund_deposit'];
    dividendReinvested = json['dividend_reinvested'];
    totalDeposit = json['total_deposit'];
    totalWithdrawal = json['total_withdrawal'];
    unitsPurchasedNos = json['units_purchased_nos'];
    cipUnitsNos = json['cip_units_nos'];
    unitsSurrenderNos = json['units_surrender_nos'];
    unitsHeld = json['units_held'];
    averageCostPriceByUnit = json['average_cost_price_by_unit'];
    investmentAtCost = json['investment_at_cost'];
    currentNav = json['current_nav'];
    currentNavDate = json['current_nav_date'];
    marketValueOfInvestment = json['market_value_of_investment'];
    capitalGainRealize = json['capital_gain_realize'];
    capitalGainUnrealize = json['capital_gain_unrealize'];
    totalCapitalGain = json['total_capital_gain'];
    dividendIncome = json['dividend_income'];
    totalReturn = json['total_return'];
    cashBalance = json['cash_balance'];
  }
  String? investmentTypeId;
  String? investmentStyle;
  String? dividendType;
  int? installmentTenure;
  dynamic installmentDate;
  dynamic installmentSize;
  String? fundDeposit;
  String? dividendReinvested;
  String? totalDeposit;
  String? totalWithdrawal;
  String? unitsPurchasedNos;
  String? cipUnitsNos;
  String? unitsSurrenderNos;
  String? unitsHeld;
  String? averageCostPriceByUnit;
  String? investmentAtCost;
  String? currentNav;
  String? currentNavDate;
  String? marketValueOfInvestment;
  String? capitalGainRealize;
  String? capitalGainUnrealize;
  String? totalCapitalGain;
  String? dividendIncome;
  String? totalReturn;
  String? cashBalance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['investment_type_id'] = investmentTypeId;
    map['investment_style'] = investmentStyle;
    map['dividend_type'] = dividendType;
    map['installment_tenure'] = installmentTenure;
    map['installment_date'] = installmentDate;
    map['installment_size'] = installmentSize;
    map['fund_deposit'] = fundDeposit;
    map['dividend_reinvested'] = dividendReinvested;
    map['total_deposit'] = totalDeposit;
    map['total_withdrawal'] = totalWithdrawal;
    map['units_purchased_nos'] = unitsPurchasedNos;
    map['cip_units_nos'] = cipUnitsNos;
    map['units_surrender_nos'] = unitsSurrenderNos;
    map['units_held'] = unitsHeld;
    map['average_cost_price_by_unit'] = averageCostPriceByUnit;
    map['investment_at_cost'] = investmentAtCost;
    map['current_nav'] = currentNav;
    map['current_nav_date'] = currentNavDate;
    map['market_value_of_investment'] = marketValueOfInvestment;
    map['capital_gain_realize'] = capitalGainRealize;
    map['capital_gain_unrealize'] = capitalGainUnrealize;
    map['total_capital_gain'] = totalCapitalGain;
    map['dividend_income'] = dividendIncome;
    map['total_return'] = totalReturn;
    map['cash_balance'] = cashBalance;
    return map;
  }
}
