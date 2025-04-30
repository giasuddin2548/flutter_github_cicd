class IpoModel {
  IpoModel({
    this.instrumentName,
    this.instrumentLotSize,
    this.facevalue,
    this.rate,
    this.totalSharePerUnit,
    this.totalAmount,
    this.businessDate,
    this.status,
    this.recordDate,
  });

  IpoModel.fromJson(dynamic json) {
    instrumentName = json['instrument_name'];
    instrumentLotSize = json['instrument_lot_size'];
    facevalue = json['facevalue'];
    rate = json['rate'];
    status = json['status'];
    totalSharePerUnit = json['total_share_per_unit'];
    totalAmount = json['total_amount'];
    businessDate = json['business_date'];
    recordDate = json['record_date'];
  }
  String? instrumentName;
  String? instrumentLotSize;
  String? facevalue;
  String? rate;
  String? status;
  String? totalSharePerUnit;
  String? totalAmount;
  String? businessDate;
  String? recordDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['instrument_name'] = instrumentName;
    map['instrument_lot_size'] = instrumentLotSize;
    map['facevalue'] = facevalue;
    map['rate'] = rate;
    map['status'] = status;
    map['total_share_per_unit'] = totalSharePerUnit;
    map['total_amount'] = totalAmount;
    map['business_date'] = businessDate;
    map['record_date'] = recordDate;
    return map;
  }
}
