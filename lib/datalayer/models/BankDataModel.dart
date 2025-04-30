class BankDataModel {
  BankDataModel({this.orgId, this.orgName});

  BankDataModel.fromJson(dynamic json) {
    orgId = json['org_id'];
    orgName = json['org_name'];
  }
  int? orgId;
  String? orgName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['org_id'] = orgId;
    map['org_name'] = orgName;
    return map;
  }
}
