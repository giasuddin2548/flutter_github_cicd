class NetisProductModel {
  NetisProductModel({
    this.productId,
    this.productName,
    this.productCode,
    this.productCategory,
    this.productBrand,
    this.productModel,
    this.image,
  });

  NetisProductModel.fromJson(dynamic json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productCode = json['product_code'];
    productCategory = json['product_category'];
    productBrand = json['product_brand'];
    productModel = json['product_model'];
    image = json['image'];
  }
  int? productId;
  String? productName;
  bool? productCode;
  String? productCategory;
  bool? productBrand;
  bool? productModel;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['product_name'] = productName;
    map['product_code'] = productCode;
    map['product_category'] = productCategory;
    map['product_brand'] = productBrand;
    map['product_model'] = productModel;
    map['image'] = image;
    return map;
  }
}
