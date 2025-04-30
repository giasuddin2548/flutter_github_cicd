class DepositList {
  DepositList({
    this.orgName,
    this.paymentType,
    this.chqNo,
    this.amount,
    this.status,
    this.chqDate,
    this.businessDate,
    this.recordDate,
  });

  DepositList.fromJson(dynamic json) {
    orgName = json['org_name'];
    paymentType = json['payment_type'];
    chqNo = json['chq_no'];
    amount = json['amount'];
    status = json['status'];
    chqDate = json['chq_date'];
    businessDate = json['business_date'];
    recordDate = json['record_date'];
  }
  String? orgName;
  String? paymentType;
  String? chqNo;
  String? amount;
  String? status;
  String? chqDate;
  String? businessDate;
  String? recordDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['org_name'] = orgName;
    map['payment_type'] = paymentType;
    map['chq_no'] = chqNo;
    map['amount'] = amount;
    map['status'] = status;
    map['chq_date'] = chqDate;
    map['business_date'] = businessDate;
    map['record_date'] = recordDate;
    return map;
  }
}
