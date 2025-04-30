import 'bank_list.dart';
import 'fund_list.dart';
import 'investor.dart';
import 'investor_user.dart';

class UpdateProfileBasicData {
  UpdateProfileBasicData({
    // this.title,
    this.investor,
    this.investorUser,
    // this.saveReqCheck,
    this.fundList,
    this.bankList,
    // this.branchList,
    // this.accountList,
    // this.investorInformation,
    this.investorDetailsId,
  });

  UpdateProfileBasicData.fromJson(dynamic json) {
    // title = json['title'];
    investor =
        json['investor'] != null ? Investor.fromJson(json['investor']) : null;
    investorUser =
        json['investorUser'] != null
            ? InvestorUser.fromJson(json['investorUser'])
            : null;
    // saveReqCheck = json['saveReqCheck'];
    if (json['fundList'] != null) {
      fundList = [];
      json['fundList'].forEach((v) {
        fundList?.add(FundList.fromJson(v));
      });
    }
    if (json['bankList'] != null) {
      bankList = [];
      json['bankList'].forEach((v) {
        bankList?.add(BankList.fromJson(v));
      });
    }
    // branchList = json['branchList'];
    // if (json['accountList'] != null) {
    //   accountList = [];
    //   json['accountList'].forEach((v) {
    //     accountList?.add(dynamic.fromJson(v));
    //   });
    // }
    // if (json['investorInformation'] != null) {
    //   investorInformation = [];
    //   json['investorInformation'].forEach((v) {
    //     investorInformation?.add(dynamic.fromJson(v));
    //   });
    // }
    investorDetailsId = json['investorDetailsId'];
  }
  // String? title;
  Investor? investor;
  InvestorUser? investorUser;
  // String? saveReqCheck;
  List<FundList>? fundList;
  List<BankList>? bankList;
  // BranchList? branchList;
  // List<dynamic>? accountList;
  // List<dynamic>? investorInformation;
  String? investorDetailsId;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['title'] = title;
  //   if (investor != null) {
  //     map['investor'] = investor?.toJson();
  //   }
  //   if (investorUser != null) {
  //     map['investorUser'] = investorUser?.toJson();
  //   }
  //   map['saveReqCheck'] = saveReqCheck;
  //   if (fundList != null) {
  //     map['fundList'] = fundList?.map((v) => v.toJson()).toList();
  //   }
  //   if (bankList != null) {
  //     map['bankList'] = bankList?.map((v) => v.toJson()).toList();
  //   }
  //   map['branchList'] = branchList;
  //   if (accountList != null) {
  //     map['accountList'] = accountList?.map((v) => v.toJson()).toList();
  //   }
  //   if (investorInformation != null) {
  //     map['investorInformation'] = investorInformation?.map((v) => v.toJson()).toList();
  //   }
  //   map['investorDetailsId'] = investorDetailsId;
  //   return map;
  // }
}
