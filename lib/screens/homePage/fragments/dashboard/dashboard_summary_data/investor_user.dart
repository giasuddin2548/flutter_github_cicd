class InvestorUser {
  InvestorUser({
    this.investorname,
    this.investorfirstname,
    this.investorlastname,
  });

  InvestorUser.fromJson(dynamic json) {
    investorname = json['INVESTOR_NAME'];
    investorfirstname = json['INVESTOR_FIRST_NAME'];
    investorlastname = json['INVESTOR_LAST_NAME'];
  }
  String? investorname;
  String? investorfirstname;
  String? investorlastname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['INVESTOR_NAME'] = investorname;
    map['INVESTOR_FIRST_NAME'] = investorfirstname;
    map['INVESTOR_LAST_NAME'] = investorlastname;
    return map;
  }
}
