class LastFiveTransactions {
  LastFiveTransactions({
    this.totalamount,
    this.businessdate,
    this.buyQuantity,
    this.rate,
    this.sellsurrflag,
  });

  LastFiveTransactions.fromJson(dynamic json) {
    totalamount = json['TOTAL_AMOUNT'];
    businessdate = json['BUSINESS_DATE'];
    buyQuantity = json['Buy_Quantity'];
    rate = json['RATE'];
    sellsurrflag = json['SELL_SURR_FLAG'];
  }
  String? totalamount;
  String? businessdate;
  String? buyQuantity;
  String? rate;
  String? sellsurrflag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TOTAL_AMOUNT'] = totalamount;
    map['BUSINESS_DATE'] = businessdate;
    map['Buy_Quantity'] = buyQuantity;
    map['RATE'] = rate;
    map['SELL_SURR_FLAG'] = sellsurrflag;
    return map;
  }
}
