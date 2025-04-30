import 'LatestTransactionHistory.dart';

class Data {
  Data({this.latestTransactionHistory});

  Data.fromJson(dynamic json) {
    if (json['latest_transaction_history'] != null) {
      latestTransactionHistory = [];
      json['latest_transaction_history'].forEach((v) {
        latestTransactionHistory?.add(LatestTransactionHistory.fromJson(v));
      });
    }
  }
  List<LatestTransactionHistory>? latestTransactionHistory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (latestTransactionHistory != null) {
      map['latest_transaction_history'] =
          latestTransactionHistory?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
