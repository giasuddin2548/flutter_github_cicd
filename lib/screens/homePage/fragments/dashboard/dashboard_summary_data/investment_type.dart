class InvestmentType {
  InvestmentType({
    // this.investmenttypeid,
    this.investmenttype,

    // this.description,
    // this.businessdate,
    // this.recorddate,
    // this.operateby,
  });

  InvestmentType.fromJson(dynamic json) {
    // investmenttypeid = json['INVESTMENT_TYPE_ID'];
    investmenttype = json['INVESTMENT_TYPE'];
    // description = json['DESCRIPTION'];
    // businessdate = json['BUSINESS_DATE'];
    // recorddate = json['RECORD_DATE'];
    // operateby = json['OPERATE_BY'];
  }
  // String? investmenttypeid;
  String? investmenttype;
  // String? description;
  // String? businessdate;
  // String? recorddate;
  // String? operateby;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['INVESTMENT_TYPE_ID'] = investmenttypeid;
    map['INVESTMENT_TYPE'] = investmenttype;
    // map['DESCRIPTION'] = description;
    // map['BUSINESS_DATE'] = businessdate;
    // map['RECORD_DATE'] = recorddate;
    // map['OPERATE_BY'] = operateby;
    return map;
  }
}
