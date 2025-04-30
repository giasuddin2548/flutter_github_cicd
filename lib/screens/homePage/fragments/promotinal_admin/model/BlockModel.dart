class BlockModel {
  BlockModel({
    this.id,
    this.productName,
    this.portfolioCode,
    this.investorName,
  });

  BlockModel.fromJson(dynamic json) {
    id = json['id'];
    productName = json['product_name'];
    portfolioCode = json['portfolio_code'];
    investorName = json['investor_name'];
  }
  String? id;
  String? productName;
  String? portfolioCode;
  String? investorName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_name'] = productName;
    map['portfolio_code'] = portfolioCode;
    map['investor_name'] = investorName;
    return map;
  }
}
