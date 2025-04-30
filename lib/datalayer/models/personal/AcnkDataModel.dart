import 'InvestorInformation.dart';
import 'NomineeInformation.dart';
import 'JointInformation.dart';

class AcnkDataModel {
  AcnkDataModel({
    this.status,
    this.investorInformation,
    this.nomineeInformation,
    this.jointInformation,
  });

  AcnkDataModel.fromJson(dynamic json) {
    status = json['status'];
    investorInformation =
        json['investor_information'] != null
            ? InvestorInformation.fromJson(json['investor_information'])
            : null;
    if (json['nominee_information'] != null) {
      nomineeInformation = [];
      json['nominee_information'].forEach((v) {
        nomineeInformation?.add(NomineeInformation.fromJson(v));
      });
    }
    if (json['joint_information'] != null) {
      jointInformation = [];
      json['joint_information'].forEach((v) {
        jointInformation?.add(JointInformation.fromJson(v));
      });
    }
  }
  String? status;
  InvestorInformation? investorInformation;
  List<NomineeInformation>? nomineeInformation;
  List<JointInformation>? jointInformation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (investorInformation != null) {
      map['investor_information'] = investorInformation?.toJson();
    }
    if (nomineeInformation != null) {
      map['nominee_information'] =
          nomineeInformation?.map((v) => v.toJson()).toList();
    }
    if (jointInformation != null) {
      map['joint_information'] =
          jointInformation?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
