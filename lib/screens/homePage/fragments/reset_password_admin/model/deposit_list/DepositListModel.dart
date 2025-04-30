import 'DepositList.dart';

class DepositListModel {
  DepositListModel({this.status, this.depositList});

  DepositListModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['deposit_list'] != null) {
      depositList = [];
      json['deposit_list'].forEach((v) {
        depositList?.add(DepositList.fromJson(v));
      });
    }
  }
  String? status;
  List<DepositList>? depositList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (depositList != null) {
      map['deposit_list'] = depositList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
