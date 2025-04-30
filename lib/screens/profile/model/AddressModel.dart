import 'DataDict.dart';

class AddressModel {
  AddressModel({this.status, this.message, this.dataDict});

  AddressModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    dataDict =
        json['data_dict'] != null ? DataDict.fromJson(json['data_dict']) : null;
  }
  bool? status;
  String? message;
  DataDict? dataDict;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (dataDict != null) {
      map['data_dict'] = dataDict?.toJson();
    }
    return map;
  }
}
