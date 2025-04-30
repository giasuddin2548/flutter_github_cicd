class AccountList {
  AccountList({this.accountDetailsId, this.accountName});

  AccountList.fromJson(dynamic json) {
    accountDetailsId = json['account_details_id'];
    accountName = json['account_name'];
  }
  int? accountDetailsId;
  String? accountName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account_details_id'] = accountDetailsId;
    map['account_name'] = accountName;
    return map;
  }
}
