import 'investor.dart';
import 'investor_portfolio_statement.dart';
import 'last_five_transactions.dart';

class SummaryDetailsData {
  SummaryDetailsData({
    // this.status,
    // this.message,
    this.investor,
    this.unitHeld,
    // this.unitApp,
    // this.fund,
    // this.registration,
    this.totalProfitLoss,
    this.investorPortfolioStatement,
    // this.investorUser,
    // this.investorBankAccountInfo,
    // this.fundBankAccountInfoResult,
    // this.fundBeftnBankAccountInfoResult,
    this.lastFiveTransactions,
    this.dividendIncome,
    this.dividendCip,
  });

  SummaryDetailsData.fromJson(dynamic json) {
    // status = json['status'];
    // message = json['message'];
    investor =
        json['investor'] != null ? Investor.fromJson(json['investor']) : null;
    unitHeld = json['unitHeld'].toString();
    // unitApp = json['unitApp'] != null ? UnitApp.fromJson(json['unitApp']) : null;
    // fund = json['fund'];
    // registration = json['registration'];
    totalProfitLoss = json['total_profit_loss'].toString();
    investorPortfolioStatement =
        json['investorPortfolioStatement'] != null
            ? InvestorPortfolioStatement.fromJson(
              json['investorPortfolioStatement'],
            )
            : null;
    // investorUser = json['investorUser'] != null ? InvestorUser.fromJson(json['investorUser']) : null;
    // if (json['investorBankAccountInfo'] != null) {
    //   investorBankAccountInfo = [];
    //   json['investorBankAccountInfo'].forEach((v) {
    //     investorBankAccountInfo?.add(InvestorBankAccountInfo.fromJson(v));
    //   });
    // }
    // fundBankAccountInfoResult = json['fundBankAccountInfoResult'] != null ? FundBankAccountInfoResult.fromJson(json['fundBankAccountInfoResult']) : null;
    // fundBeftnBankAccountInfoResult = json['fundBeftnBankAccountInfoResult'];
    if (json['lastFiveTransactions'] != null) {
      lastFiveTransactions = [];
      json['lastFiveTransactions'].forEach((v) {
        lastFiveTransactions?.add(LastFiveTransactions.fromJson(v));
      });
    }
    dividendIncome = json['dividendIncome'];
    dividendCip = json['dividendCip'].toString();
  }
  // int? status;
  // String? message;
  Investor? investor;
  String? unitHeld;
  // UnitApp? unitApp;
  // String? fund;
  // String? registration;
  String? totalProfitLoss;
  InvestorPortfolioStatement? investorPortfolioStatement;
  // InvestorUser? investorUser;
  // List<InvestorBankAccountInfo>? investorBankAccountInfo;
  // FundBankAccountInfoResult? fundBankAccountInfoResult;
  // String? fundBeftnBankAccountInfoResult;
  List<LastFiveTransactions>? lastFiveTransactions;
  String? dividendIncome;
  String? dividendCip;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['status'] = status;
    // map['message'] = message;
    if (investor != null) {
      map['investor'] = investor?.toJson();
    }
    map['unitHeld'] = unitHeld;
    // if (unitApp != null) {
    //   map['unitApp'] = unitApp?.toJson();
    // }
    // map['fund'] = fund;
    // map['registration'] = registration;
    map['total_profit_loss'] = totalProfitLoss;
    if (investorPortfolioStatement != null) {
      map['investorPortfolioStatement'] = investorPortfolioStatement?.toJson();
    }
    // if (investorUser != null) {
    //   map['investorUser'] = investorUser?.toJson();
    // }
    // if (investorBankAccountInfo != null) {
    //   map['investorBankAccountInfo'] = investorBankAccountInfo?.map((v) => v.toJson()).toList();
    // }
    // if (fundBankAccountInfoResult != null) {
    //   map['fundBankAccountInfoResult'] = fundBankAccountInfoResult?.toJson();
    // }
    // map['fundBeftnBankAccountInfoResult'] = fundBeftnBankAccountInfoResult;
    if (lastFiveTransactions != null) {
      map['lastFiveTransactions'] =
          lastFiveTransactions?.map((v) => v.toJson()).toList();
    }
    map['dividendIncome'] = dividendIncome;
    map['dividendCip'] = dividendCip;
    return map;
  }
}
