import 'InvestorAccountDetailsSummury.dart';
import 'NomineeInformation.dart';

class Data {
  Data({this.investorAccountDetailsSummury, this.nomineeInformation});

  Data.fromJson(dynamic json) {
    if (json['investor_account_details_summury'] != null) {
      investorAccountDetailsSummury = [];
      json['investor_account_details_summury'].forEach((v) {
        investorAccountDetailsSummury?.add(
          InvestorAccountDetailsSummury.fromJson(v),
        );
      });
    }
    if (json['nominee_information'] != null) {
      nomineeInformation = [];
      json['nominee_information'].forEach((v) {
        nomineeInformation?.add(NomineeInformation.fromJson(v));
      });
    }
  }
  List<InvestorAccountDetailsSummury>? investorAccountDetailsSummury;
  List<NomineeInformation>? nomineeInformation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (investorAccountDetailsSummury != null) {
      map['investor_account_details_summury'] =
          investorAccountDetailsSummury?.map((v) => v.toJson()).toList();
    }
    if (nomineeInformation != null) {
      map['nominee_information'] =
          nomineeInformation?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
