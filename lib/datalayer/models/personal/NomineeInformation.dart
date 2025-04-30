class NomineeInformation {
  NomineeInformation({
    this.nomineeName,
    this.mailingAddress,
    this.relation,
    this.sharePercentage,
  });

  NomineeInformation.fromJson(dynamic json) {
    nomineeName = json['nominee_name'];
    mailingAddress = json['mailing_address'];
    relation = json['relation'];
    sharePercentage = json['share_percentage'];
  }
  String? nomineeName;
  String? mailingAddress;
  String? relation;
  String? sharePercentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nominee_name'] = nomineeName;
    map['mailing_address'] = mailingAddress;
    map['relation'] = relation;
    map['share_percentage'] = sharePercentage;
    return map;
  }
}
