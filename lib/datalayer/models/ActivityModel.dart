class ActivityModel {
  ActivityModel({this.businessDate, this.requestType});

  ActivityModel.fromJson(dynamic json) {
    businessDate = json['business_date'];
    requestType = json['request_type'];
  }
  String? businessDate;
  String? requestType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['business_date'] = businessDate;
    map['request_type'] = requestType;
    return map;
  }
}
