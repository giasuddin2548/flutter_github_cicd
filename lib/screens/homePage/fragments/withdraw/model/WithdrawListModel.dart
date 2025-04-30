import 'package:flutter_github_cicd/screens/homePage/fragments/withdraw/model/WithdrawList.dart';

class WithdrawListModel {
  WithdrawListModel({this.status, this.withdrawList});

  WithdrawListModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['withdraw_list'] != null) {
      withdrawList = [];
      json['withdraw_list'].forEach((v) {
        withdrawList?.add(WithdrawList.fromJson(v));
      });
    }
  }
  String? status;
  List<WithdrawList>? withdrawList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (withdrawList != null) {
      map['withdraw_list'] = withdrawList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
