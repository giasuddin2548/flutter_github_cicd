class Stock {
  Stock({
    this.investorunitstockid,
    this.investorunitappid,
    this.portfolioid,
    this.noofunit,
    this.remainingunits,
    this.totalportfoliounit,
    this.couaflag,
    this.freeunits,
    this.lockindays,
    this.businessdate,
    this.recorddate,
    this.operateby,
    this.averagerate,
    this.couanumber,
    this.unitmaturedate,
  });

  Stock.fromJson(dynamic json) {
    investorunitstockid = json['INVESTOR_UNIT_STOCK_ID'];
    investorunitappid = json['INVESTOR_UNIT_APP_ID'];
    portfolioid = json['PORTFOLIO_ID'];
    noofunit = json['NO_OF_UNIT'];
    remainingunits = json['REMAINING_UNITS'];
    totalportfoliounit = json['TOTAL_PORTFOLIO_UNIT'];
    couaflag = json['COUA_FLAG'];
    freeunits = json['FREE_UNITS'];
    lockindays = json['LOCK_IN_DAYS'];
    businessdate = json['BUSINESS_DATE'];
    recorddate = json['RECORD_DATE'];
    operateby = json['OPERATE_BY'];
    averagerate = json['AVERAGE_RATE'];
    couanumber = json['COUA_NUMBER'];
    unitmaturedate = json['UNIT_MATURE_DATE'];
  }
  String? investorunitstockid;
  String? investorunitappid;
  String? portfolioid;
  String? noofunit;
  String? remainingunits;
  String? totalportfoliounit;
  String? couaflag;
  String? freeunits;
  String? lockindays;
  String? businessdate;
  String? recorddate;
  String? operateby;
  String? averagerate;
  String? couanumber;
  dynamic unitmaturedate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['INVESTOR_UNIT_STOCK_ID'] = investorunitstockid;
    map['INVESTOR_UNIT_APP_ID'] = investorunitappid;
    map['PORTFOLIO_ID'] = portfolioid;
    map['NO_OF_UNIT'] = noofunit;
    map['REMAINING_UNITS'] = remainingunits;
    map['TOTAL_PORTFOLIO_UNIT'] = totalportfoliounit;
    map['COUA_FLAG'] = couaflag;
    map['FREE_UNITS'] = freeunits;
    map['LOCK_IN_DAYS'] = lockindays;
    map['BUSINESS_DATE'] = businessdate;
    map['RECORD_DATE'] = recorddate;
    map['OPERATE_BY'] = operateby;
    map['AVERAGE_RATE'] = averagerate;
    map['COUA_NUMBER'] = couanumber;
    map['UNIT_MATURE_DATE'] = unitmaturedate;
    return map;
  }
}
