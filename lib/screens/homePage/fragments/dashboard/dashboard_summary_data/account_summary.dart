import 'unit_app.dart';
import 'portfolio_statement.dart';

class AccountSummary {
  AccountSummary({
    this.registrationNo,
    this.fund,
    this.fundId,
    this.investmentType,
    this.unitApp,
    this.portfolioStatement,
    this.dividendIncome,
    this.unit,
    this.accountType,
    this.jointInvestorName,
  });

  AccountSummary.fromJson(dynamic json) {
    registrationNo = json['registrationNo'];
    fund = json['fund'];
    fundId = json['fundId'];
    investmentType = json['investmentType'];
    // unitApp = json['unitApp'] != null ? UnitApp.fromJson(json['unitApp']) : null;
    // portfolioStatement = json['portfolioStatement'] != null ? PortfolioStatement.fromJson(json['portfolioStatement']) : null;
    dividendIncome = json['dividendIncome'];
    unit = json['unit'].toString();
    accountType = json['accountType'];
    jointInvestorName = json['jointInvestorName'];
  }
  String? registrationNo;
  String? fund;
  String? fundId;
  String? investmentType;
  UnitApp? unitApp;
  PortfolioStatement? portfolioStatement;
  int? dividendIncome;
  String? unit;
  String? accountType;
  String? jointInvestorName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['registrationNo'] = registrationNo;
    map['fund'] = fund;
    map['fundId'] = fundId;
    map['investmentType'] = investmentType;
    if (unitApp != null) {
      map['unitApp'] = unitApp?.toJson();
    }
    if (portfolioStatement != null) {
      map['portfolioStatement'] = portfolioStatement?.toJson();
    }
    map['dividendIncome'] = dividendIncome;
    map['unit'] = unit;
    map['accountType'] = accountType;
    map['jointInvestorName'] = jointInvestorName;
    return map;
  }
}
