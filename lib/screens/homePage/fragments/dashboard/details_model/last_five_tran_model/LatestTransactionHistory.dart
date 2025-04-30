class LatestTransactionHistory {
  LatestTransactionHistory({this.date, this.deposit, this.withdraw});

  LatestTransactionHistory.fromJson(dynamic json) {
    date = json['date'];
    deposit = json['deposit'];
    withdraw = json['withdraw'];
  }
  String? date;
  String? deposit;
  String? withdraw;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['deposit'] = deposit;
    map['withdraw'] = withdraw;
    return map;
  }
}
