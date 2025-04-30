class InvestorPortfolioStatement {
  InvestorPortfolioStatement({
    // this.investorname,
    // this.portfoliocode,
    // this.portfolioname,
    // this.currentnoofunits,
    this.averagebuyprice,
    // this.couanumber,
    // this.totalbuyprice,
    this.nav,
    this.navdate,
    // this.investorbuyprice,
    // this.investorsaleprice,
    // this.reserveamount,
    this.currentmarketvalue,
    this.unrealizedgainloss,
    // this.gainlosspercent,
    // this.totaldeposit,
    this.unitpurchase,
    this.unitsurrender,
    // this.dividendcipunits,
    this.funddeposit,
    this.dividendreinvested,
    this.totalwithdraw,
    // this.realizedgainloss,
    this.balanceamount,

    // this.yearendunit,
    // this.dividendamount,
  });

  InvestorPortfolioStatement.fromJson(dynamic json) {
    // investorname = json['INVESTOR_NAME'];
    // portfoliocode = json['PORTFOLIO_CODE'];
    // portfolioname = json['PORTFOLIO_NAME'];
    // currentnoofunits = json['CURRENT_NO_OF_UNITS'];
    averagebuyprice = json['AVERAGE_BUY_PRICE'].toString();
    // couanumber = json['COUA_NUMBER'];
    // totalbuyprice = json['TOTAL_BUY_PRICE'];
    nav = json['NAV'];
    navdate = json['NAV_DATE'];
    // investorbuyprice = json['INVESTOR_BUY_PRICE'];
    // investorsaleprice = json['INVESTOR_SALE_PRICE'];
    // reserveamount = json['RESERVE_AMOUNT'];
    currentmarketvalue = json['CURRENT_MARKET_VALUE'].toString();
    unrealizedgainloss = json['UNREALIZED_GAIN_LOSS'].toString();
    // gainlosspercent = json['GAIN_LOSS_PERCENT'];
    // totaldeposit = json['TOTAL_DEPOSIT'];
    unitpurchase = json['UNIT_PURCHASE'];
    unitsurrender = json['UNIT_SURRENDER'];
    // dividendcipunits = json['DIVIDEND_CIP_UNITS'];
    funddeposit = json['FUND_DEPOSIT'];
    dividendreinvested = json['DIVIDEND_REINVESTED'];
    totalwithdraw = json['TOTAL_WITHDRAW'];
    // realizedgainloss = json['REALIZED_GAIN_LOSS'];
    balanceamount = json['BALANCE_AMOUNT'];
    // yearendunit = json['YEAR_END_UNIT'];
    // dividendamount = json['DIVIDEND_AMOUNT'];
  }
  // String? investorname;
  // String? portfoliocode;
  // String? portfolioname;
  // String? currentnoofunits;
  String? averagebuyprice;
  // String? couanumber;
  // String? totalbuyprice;
  String? nav;
  String? navdate;
  // String? investorbuyprice;
  // String? investorsaleprice;
  // dynamic reserveamount;
  String? currentmarketvalue;
  String? unrealizedgainloss;
  // String? gainlosspercent;
  // String? totaldeposit;
  String? unitpurchase;
  String? unitsurrender;
  // dynamic dividendcipunits;
  String? funddeposit;
  String? dividendreinvested;
  String? totalwithdraw;
  // String? realizedgainloss;
  String? balanceamount;
  // String? yearendunit;
  // String? dividendamount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['INVESTOR_NAME'] = investorname;
    // map['PORTFOLIO_CODE'] = portfoliocode;
    // map['PORTFOLIO_NAME'] = portfolioname;
    // map['CURRENT_NO_OF_UNITS'] = currentnoofunits;
    map['AVERAGE_BUY_PRICE'] = averagebuyprice;
    // map['COUA_NUMBER'] = couanumber;
    // map['TOTAL_BUY_PRICE'] = totalbuyprice;
    map['NAV'] = nav;
    map['NAV_DATE'] = navdate;
    // map['INVESTOR_BUY_PRICE'] = investorbuyprice;
    // map['INVESTOR_SALE_PRICE'] = investorsaleprice;
    // map['RESERVE_AMOUNT'] = reserveamount;
    map['CURRENT_MARKET_VALUE'] = currentmarketvalue;
    map['UNREALIZED_GAIN_LOSS'] = unrealizedgainloss;
    // map['GAIN_LOSS_PERCENT'] = gainlosspercent;
    // map['TOTAL_DEPOSIT'] = totaldeposit;
    map['UNIT_PURCHASE'] = unitpurchase;
    map['UNIT_SURRENDER'] = unitsurrender;
    // map['DIVIDEND_CIP_UNITS'] = dividendcipunits;
    map['FUND_DEPOSIT'] = funddeposit;
    map['DIVIDEND_REINVESTED'] = dividendreinvested;
    map['TOTAL_WITHDRAW'] = totalwithdraw;
    // map['REALIZED_GAIN_LOSS'] = realizedgainloss;
    map['BALANCE_AMOUNT'] = balanceamount;
    // map['YEAR_END_UNIT'] = yearendunit;
    // map['DIVIDEND_AMOUNT'] = dividendamount;
    return map;
  }
}
