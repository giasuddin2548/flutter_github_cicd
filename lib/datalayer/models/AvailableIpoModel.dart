class AvailableIpoModel {
  AvailableIpoModel({
    this.ipoDetailsId,
    this.instrumentName,
    this.instrumentLotSize,
    this.rate,
    this.facevalue,
    this.totalAmount,
  });

  AvailableIpoModel.fromJson(dynamic json) {
    ipoDetailsId = json['ipo_details_id'];
    instrumentName = json['instrument_name'];
    instrumentLotSize = json['instrument_lot_size'];
    rate = json['rate'];
    facevalue = json['facevalue'];
    totalAmount = json['total_amount'];
  }
  int? ipoDetailsId;
  String? instrumentName;
  String? instrumentLotSize;
  String? rate;
  String? facevalue;
  String? totalAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ipo_details_id'] = ipoDetailsId;
    map['instrument_name'] = instrumentName;
    map['instrument_lot_size'] = instrumentLotSize;
    map['rate'] = rate;
    map['facevalue'] = facevalue;
    map['total_amount'] = totalAmount;
    return map;
  }
}
