import 'PortfolioStatement.dart';

class Data {
  Data({this.portfolioStatement});

  Data.fromJson(dynamic json) {
    if (json['portfolio_statement'] != null) {
      portfolioStatement = [];
      json['portfolio_statement'].forEach((v) {
        portfolioStatement?.add(PortfolioStatement.fromJson(v));
      });
    }
  }
  List<PortfolioStatement>? portfolioStatement;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (portfolioStatement != null) {
      map['portfolio_statement'] =
          portfolioStatement?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
