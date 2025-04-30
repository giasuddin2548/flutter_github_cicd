class BankList {
  BankList({this.id, this.name});

  BankList.fromJson(dynamic json) {
    id = json['ORG_ID'];
    name = json['ORG_NAME'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ORG_ID'] = id;
    map['ORG_NAME'] = name;
    return map;
  }
}
