import 'InvestorAccountDetailsSummury.dart';

class Data {
  Data({this.investorAccountDetailsSummury});

  Data.fromJson(dynamic json) {
    if (json['investor_account_details_summury'] != null) {
      investorAccountDetailsSummury = [];
      json['investor_account_details_summury'].forEach((v) {
        investorAccountDetailsSummury!.add(
          InvestorAccountDetailsSummury.fromJson(v),
        );
      });
    }
  }
  List<InvestorAccountDetailsSummury>? investorAccountDetailsSummury;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (investorAccountDetailsSummury != null) {
      map['investor_account_details_summury'] =
          investorAccountDetailsSummury!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
