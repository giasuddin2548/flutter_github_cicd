class FundBankAccountInfoResult {
  FundBankAccountInfoResult({
    this.accountname,
    this.accountno,
    this.nameofthebank,
    this.branchname,
    this.routingno,
  });

  FundBankAccountInfoResult.fromJson(dynamic json) {
    accountname = json['ACCOUNT_NAME'];
    accountno = json['ACCOUNT_NO'];
    nameofthebank = json['NAME_OF_THE_BANK'];
    branchname = json['BRANCH_NAME'];
    routingno = json['ROUTING_NO'];
  }
  String? accountname;
  String? accountno;
  String? nameofthebank;
  String? branchname;
  String? routingno;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ACCOUNT_NAME'] = accountname;
    map['ACCOUNT_NO'] = accountno;
    map['NAME_OF_THE_BANK'] = nameofthebank;
    map['BRANCH_NAME'] = branchname;
    map['ROUTING_NO'] = routingno;
    return map;
  }
}
