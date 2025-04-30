class NotificationModel {
  NotificationModel({
    this.investorDetailsId,
    this.message,
    this.status,
    this.requestType,
  });

  NotificationModel.fromJson(dynamic json) {
    investorDetailsId = json['investor_details_id'];
    message = json['message'];
    status = json['status'];
    requestType = json['request_type'];
  }
  String? investorDetailsId;
  String? message;
  String? status;
  String? requestType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['investor_details_id'] = investorDetailsId;
    map['message'] = message;
    map['status'] = status;
    map['request_type'] = requestType;
    return map;
  }
}
