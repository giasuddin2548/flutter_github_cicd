class PaymentModel {
  PaymentModel({
    this.id,
    this.name,
    this.minimumWithdrawal,
    this.isActive,
    this.image,
  });

  PaymentModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    minimumWithdrawal = json['minimum_withdrawal'];
    isActive = json['is_active'];
    image = json['image'];
  }
  int? id;
  String? name;
  double? minimumWithdrawal;
  bool? isActive;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['minimum_withdrawal'] = minimumWithdrawal;
    map['is_active'] = isActive;
    map['image'] = image;
    return map;
  }
}
