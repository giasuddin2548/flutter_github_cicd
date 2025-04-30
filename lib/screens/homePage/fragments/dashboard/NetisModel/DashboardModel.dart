import 'DashboardData.dart';

class DashboardModel {
  DashboardModel({this.status, this.message, this.dashboardData});

  DashboardModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    dashboardData =
        json['dashboard_data'] != null
            ? DashboardData.fromJson(json['dashboard_data'])
            : null;
  }
  bool? status;
  String? message;
  DashboardData? dashboardData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (dashboardData != null) {
      map['dashboard_data'] = dashboardData?.toJson();
    }
    return map;
  }
}
