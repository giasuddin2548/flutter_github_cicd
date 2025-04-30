class AccountModel25 {
  AccountModel25({
    this.templateId,
    this.investorDetailsId,
    this.portfolioCode,
    this.investorName,
  });

  AccountModel25.fromJson(dynamic json) {
    templateId = json['template_id'];
    investorDetailsId = json['investor_details_id'];
    portfolioCode = json['portfolio_code'];
    investorName = json['investor_name'];
  }
  String? templateId;
  String? investorDetailsId;
  String? portfolioCode;
  String? investorName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['template_id'] = templateId;
    map['investor_details_id'] = investorDetailsId;
    map['portfolio_code'] = portfolioCode;
    map['investor_name'] = investorName;
    return map;
  }
}
