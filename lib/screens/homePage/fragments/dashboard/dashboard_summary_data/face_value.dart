class FaceValue {
  FaceValue({
    this.portfoliofacevalueid,
    this.fundid,
    this.startdate,
    this.enddate,
    this.facevalue,
    this.recorddate,
  });

  FaceValue.fromJson(dynamic json) {
    portfoliofacevalueid = json['PORTFOLIO_FACE_VALUE_ID'];
    fundid = json['FUND_ID'];
    startdate = json['START_DATE'];
    enddate = json['END_DATE'];
    facevalue = json['FACE_VALUE'];
    recorddate = json['RECORD_DATE'];
  }
  String? portfoliofacevalueid;
  String? fundid;
  String? startdate;
  dynamic enddate;
  String? facevalue;
  String? recorddate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PORTFOLIO_FACE_VALUE_ID'] = portfoliofacevalueid;
    map['FUND_ID'] = fundid;
    map['START_DATE'] = startdate;
    map['END_DATE'] = enddate;
    map['FACE_VALUE'] = facevalue;
    map['RECORD_DATE'] = recorddate;
    return map;
  }
}
