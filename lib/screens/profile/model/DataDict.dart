import 'District.dart';
import 'Thana.dart';

class DataDict {
  DataDict({this.district, this.thana});

  DataDict.fromJson(dynamic json) {
    if (json['district'] != null) {
      district = [];
      json['district'].forEach((v) {
        district?.add(District.fromJson(v));
      });
    }
    if (json['thana'] != null) {
      thana = [];
      json['thana'].forEach((v) {
        thana?.add(Thana.fromJson(v));
      });
    }
  }
  List<District>? district;
  List<Thana>? thana;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (district != null) {
      map['district'] = district?.map((v) => v.toJson()).toList();
    }
    if (thana != null) {
      map['thana'] = thana?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
