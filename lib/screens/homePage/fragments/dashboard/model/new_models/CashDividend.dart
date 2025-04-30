class CashDividend {
  CashDividend({
    this.symbol,
    this.cashdiv,
    this.taxdivamount,
    this.grossdivamount,
    this.portfoliocode,
    this.holdingshare,
    this.divrecdate,
    this.maturitydate,
    this.cashperc,
    this.sectorname,
    this.businessdate,
    this.nextcoupondate,
  });

  CashDividend.fromJson(dynamic json) {
    symbol = json['SYMBOL'];
    cashdiv = json['CASH_DIV'];
    taxdivamount = json['TAX_DIV_AMOUNT'];
    grossdivamount = json['GROSS_DIV_AMOUNT'];
    portfoliocode = json['PORTFOLIO_CODE'];
    holdingshare = json['HOLDING_SHARE'];
    divrecdate = json['DIV_REC_DATE'];
    maturitydate = json['MATURITY_DATE'];
    cashperc = json['CASH_PERC'];
    sectorname = json['SECTOR_NAME'];
    businessdate = json['BUSINESS_DATE'];
    nextcoupondate = json['NEXT_COUPON_DATE'];
  }
  String? symbol;
  String? cashdiv;
  String? taxdivamount;
  String? grossdivamount;
  String? portfoliocode;
  String? holdingshare;
  String? divrecdate;
  String? maturitydate;
  String? cashperc;
  String? sectorname;
  String? businessdate;
  String? nextcoupondate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SYMBOL'] = symbol;
    map['CASH_DIV'] = cashdiv;
    map['TAX_DIV_AMOUNT'] = taxdivamount;
    map['GROSS_DIV_AMOUNT'] = grossdivamount;
    map['PORTFOLIO_CODE'] = portfoliocode;
    map['HOLDING_SHARE'] = holdingshare;
    map['DIV_REC_DATE'] = divrecdate;
    map['MATURITY_DATE'] = maturitydate;
    map['CASH_PERC'] = cashperc;
    map['SECTOR_NAME'] = sectorname;
    map['BUSINESS_DATE'] = businessdate;
    map['NEXT_COUPON_DATE'] = nextcoupondate;
    return map;
  }
}
