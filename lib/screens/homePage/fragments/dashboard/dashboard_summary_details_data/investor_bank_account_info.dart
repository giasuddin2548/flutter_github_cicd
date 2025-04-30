class InvestorBankAccountInfo {
  InvestorBankAccountInfo({
    this.investorregno,
    this.portfolioid,
    this.virtualaccountnumber,
    this.bankaccountno,
    this.fundname,
    this.bankname,
    this.bankid,
    this.branchname,
    this.orgbranchid,
  });

  InvestorBankAccountInfo.fromJson(dynamic json) {
    investorregno = json['INVESTOR_REG_NO'];
    portfolioid = json['PORTFOLIO_ID'];
    virtualaccountnumber = json['VIRTUAL_ACCOUNT_NUMBER'];
    bankaccountno = json['BANK_ACCOUNT_NO'];
    fundname = json['FUND_NAME'];
    bankname = json['BANK_NAME'];
    bankid = json['BANK_ID'];
    branchname = json['BRANCH_NAME'];
    orgbranchid = json['ORG_BRANCH_ID'];
  }
  String? investorregno;
  String? portfolioid;
  dynamic virtualaccountnumber;
  String? bankaccountno;
  String? fundname;
  String? bankname;
  String? bankid;
  String? branchname;
  String? orgbranchid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['INVESTOR_REG_NO'] = investorregno;
    map['PORTFOLIO_ID'] = portfolioid;
    map['VIRTUAL_ACCOUNT_NUMBER'] = virtualaccountnumber;
    map['BANK_ACCOUNT_NO'] = bankaccountno;
    map['FUND_NAME'] = fundname;
    map['BANK_NAME'] = bankname;
    map['BANK_ID'] = bankid;
    map['BRANCH_NAME'] = branchname;
    map['ORG_BRANCH_ID'] = orgbranchid;
    return map;
  }
}
