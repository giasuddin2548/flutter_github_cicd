import 'account_summary.dart';
import 'investor_user.dart';
import 'pending_surrender.dart';

class DashboardInvestorSummary {
  DashboardInvestorSummary({
    // this.status,
    // this.message,
    this.accountSummary,
    // this.title,
    // this.investor,
    this.investorUser,
    // this.investorJointAccount,
    this.pendingSurrender,
  });

  DashboardInvestorSummary.fromJson(dynamic json) {
    // status = json['status'];
    // message = json['message'];
    if (json['accountSummary'] != null) {
      accountSummary = [];
      json['accountSummary'].forEach((v) {
        accountSummary?.add(AccountSummary.fromJson(v));
      });
    }
    // title = json['title'];
    // investor = json['investor'] != null ? Investor.fromJson(json['investor']) : null;
    investorUser =
        json['investorUser'] != null
            ? InvestorUser.fromJson(json['investorUser'])
            : null;
    // investorJointAccount = json['investorJointAccount'];
    if (json['pendingSurrender'] == '') {
      pendingSurrender = [];
    } else {
      pendingSurrender = [];
      json['pendingSurrender'].forEach((v) {
        pendingSurrender?.add(PendingSurrender.fromJson(v));
      });
    }
  }
  // int? status;
  // String? message;
  List<AccountSummary>? accountSummary;
  // String? title;
  // Investor? investor;
  InvestorUser? investorUser;
  // String? investorJointAccount;
  List<PendingSurrender>? pendingSurrender;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   // map['status'] = status;
  //   // map['message'] = message;
  //   if (accountSummary != null) {
  //     map['accountSummary'] = accountSummary?.map((v) => v.toJson()).toList();
  //   }
  //   // map['title'] = title;
  //   // if (investor != null) {
  //   //   map['investor'] = investor?.toJson();
  //   // }
  //   if (investorUser != null) {
  //     map['investorUser'] = investorUser?.toJson();
  //   }
  //   // map['investorJointAccount'] = investorJointAccount;
  //   if (pendingSurrender == null) {
  //     map['pendingSurrender'] = pendingSurrender?.map((v) => v.toJson()).toList();
  //   }else{
  //     map['pendingSurrender'] = pendingSurrender?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}
