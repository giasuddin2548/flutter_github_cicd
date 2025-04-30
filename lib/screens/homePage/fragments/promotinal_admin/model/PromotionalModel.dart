class PromotionalModel {
  PromotionalModel({
    this.id,
    this.newsType,
    this.dashboard,
    this.subject,
    this.bodyDetails,
    this.startDate,
    this.endDate,
    this.attchmentPath,
    this.status,
    this.createdAt,
  });

  PromotionalModel.fromJson(dynamic json) {
    id = json['id'];
    newsType = json['news_type'];
    dashboard = json['dashboard'];
    subject = json['subject'];
    bodyDetails = json['body_details'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    attchmentPath = json['attchment_path'];
    status = json['status'];
    createdAt = json['created_at'];
  }
  String? id;
  String? newsType;
  String? dashboard;
  String? subject;
  String? bodyDetails;
  String? startDate;
  String? endDate;
  dynamic attchmentPath;
  String? status;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['news_type'] = newsType;
    map['dashboard'] = dashboard;
    map['subject'] = subject;
    map['body_details'] = bodyDetails;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['attchment_path'] = attchmentPath;
    map['status'] = status;
    map['created_at'] = createdAt;
    return map;
  }
}
