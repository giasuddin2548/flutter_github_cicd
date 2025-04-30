class Tasks {
  Tasks({
    this.productName,
    this.investorName,
    this.investorAddress,
    this.portfolioCode,
    this.boAccountNo,
    this.mobile,
    this.templateId,
    this.tenureYear,
    this.tenureMatureDate,
    this.monthlyScheme,
    this.dateOfAccOpening,
    this.accountClose,
    this.accountSuspend,
    this.accountEnableDisable,
    this.marginNonmargin,
    this.instrumentDetailsId,
    this.totalShare,
    this.avgRate,
    this.totalCostAmount,
    this.totalMktAmount,
    this.maturedShare,
    this.instrumentName,
    this.closePrice,
    this.charge,
    this.sectorName,
    this.symbol,
    this.marginOrNonmarginFlag,
    this.ycp,
    this.ratioValue,
  });

  Tasks.fromJson(dynamic json) {
    productName = json['product_name'];
    investorName = json['investor_name'];
    investorAddress = json['investor_address'];
    portfolioCode = json['portfolio_code'];
    boAccountNo = json['bo_account_no'];
    mobile = json['mobile'];
    templateId = json['template_id'];
    tenureYear = json['tenure_year'];
    tenureMatureDate = json['tenure_mature_date'];
    monthlyScheme = json['monthly_scheme'];
    dateOfAccOpening = json['date_of_acc_opening'];
    accountClose = json['account_close'];
    accountSuspend = json['account_suspend'];
    accountEnableDisable = json['account_enable_disable'];
    marginNonmargin = json['margin_nonmargin'];
    instrumentDetailsId = json['instrument_details_id'];
    totalShare = json['total_share'];
    avgRate = json['avg_rate'];
    totalCostAmount = json['total_cost_amount'];
    totalMktAmount = json['total_mkt_amount'];
    maturedShare = json['matured_share'];
    instrumentName = json['instrument_name'];
    closePrice = json['close_price'];
    charge = json['charge'];
    sectorName = json['sector_name'];
    symbol = json['symbol'];
    marginOrNonmarginFlag = json['margin_or_nonmargin_flag'];
    ycp = json['ycp'];
    ratioValue = json['ratio_value'];
  }
  String? productName;
  String? investorName;
  String? investorAddress;
  String? portfolioCode;
  String? boAccountNo;
  String? mobile;
  String? templateId;
  dynamic tenureYear;
  String? tenureMatureDate;
  String? monthlyScheme;
  String? dateOfAccOpening;
  String? accountClose;
  String? accountSuspend;
  String? accountEnableDisable;
  String? marginNonmargin;
  String? instrumentDetailsId;
  String? totalShare;
  String? avgRate;
  String? totalCostAmount;
  String? totalMktAmount;
  String? maturedShare;
  String? instrumentName;
  String? closePrice;
  String? charge;
  dynamic sectorName;
  String? symbol;
  String? marginOrNonmarginFlag;
  String? ycp;
  String? ratioValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_name'] = productName;
    map['investor_name'] = investorName;
    map['investor_address'] = investorAddress;
    map['portfolio_code'] = portfolioCode;
    map['bo_account_no'] = boAccountNo;
    map['mobile'] = mobile;
    map['template_id'] = templateId;
    map['tenure_year'] = tenureYear;
    map['tenure_mature_date'] = tenureMatureDate;
    map['monthly_scheme'] = monthlyScheme;
    map['date_of_acc_opening'] = dateOfAccOpening;
    map['account_close'] = accountClose;
    map['account_suspend'] = accountSuspend;
    map['account_enable_disable'] = accountEnableDisable;
    map['margin_nonmargin'] = marginNonmargin;
    map['instrument_details_id'] = instrumentDetailsId;
    map['total_share'] = totalShare;
    map['avg_rate'] = avgRate;
    map['total_cost_amount'] = totalCostAmount;
    map['total_mkt_amount'] = totalMktAmount;
    map['matured_share'] = maturedShare;
    map['instrument_name'] = instrumentName;
    map['close_price'] = closePrice;
    map['charge'] = charge;
    map['sector_name'] = sectorName;
    map['symbol'] = symbol;
    map['margin_or_nonmargin_flag'] = marginOrNonmarginFlag;
    map['ycp'] = ycp;
    map['ratio_value'] = ratioValue;
    return map;
  }
}
