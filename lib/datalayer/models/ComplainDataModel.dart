class ComplainDataModel {
  ComplainDataModel({
    this.requestId,
    this.portfolioCode,
    this.requestType,
    this.requestMessage,
    this.requestDate,
    this.businessDate,
    this.operateBy,
    this.status,
  });

  ComplainDataModel.fromJson(dynamic json) {
    requestId = json['request_id'];
    portfolioCode = json['portfolio_code'];
    requestType = json['request_type'];
    requestMessage = json['request_message'];
    requestDate = json['request_date'];
    businessDate = json['business_date'];
    operateBy = json['operate_by'];
    status = json['status'];
  }
  int? requestId;
  String? portfolioCode;
  String? requestType;
  String? requestMessage;
  String? requestDate;
  String? businessDate;
  dynamic operateBy;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['request_id'] = requestId;
    map['portfolio_code'] = portfolioCode;
    map['request_type'] = requestType;
    map['request_message'] = requestMessage;
    map['request_date'] = requestDate;
    map['business_date'] = businessDate;
    map['operate_by'] = operateBy;
    map['status'] = status;
    return map;
  }
}
