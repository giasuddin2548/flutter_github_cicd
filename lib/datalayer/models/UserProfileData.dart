class UserProfileData {
  UserProfileData({
    this.investorName,
    this.fatherName,
    this.motherName,
    this.investorCode,
    this.residency,
    this.portfolioCode,
    this.mailingAddress,
    this.mobile,
    this.email,
    this.nid,
    this.bankAccountNo,
    this.boAccountNo,
    this.bankId,
    this.bankName,
    this.branchId,
    this.branchName,
    this.branchRoutingNo,
    this.productName,
    this.dob,
  });

  UserProfileData.fromJson(dynamic json) {
    investorName = json['investor_name'];
    fatherName = json['father_name'];
    investorCode = json['portfolio_code'];
    motherName = json['mother_name'];
    residency = json['residency'];
    portfolioCode = json['portfolio_code'];
    mailingAddress = json['mailing_address'];
    mobile = json['mobile'];
    email = json['email'];
    nid = json['nid'];
    bankAccountNo = json['bank_account_no'];
    boAccountNo = json['bo_account_no'];
    bankId = json['bank_id'];
    bankName = json['bank_name'];
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    branchRoutingNo = json['branch_routing_no'];
    productName = json['product_name'];
    dob = json['dob'];
  }
  String? investorName;
  String? fatherName;
  String? investorCode;
  String? motherName;
  String? residency;
  String? portfolioCode;
  String? mailingAddress;
  String? mobile;
  String? email;
  String? nid;
  String? bankAccountNo;
  String? boAccountNo;
  int? bankId;
  String? bankName;
  int? branchId;
  String? branchName;
  dynamic branchRoutingNo;
  String? productName;
  String? dob;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['investor_name'] = investorName;
    map['father_name'] = fatherName;
    map['mother_name'] = motherName;
    map['residency'] = residency;
    map['portfolio_code'] = portfolioCode;
    map['mailing_address'] = mailingAddress;
    map['mobile'] = mobile;
    map['email'] = email;
    map['nid'] = nid;
    map['bank_account_no'] = bankAccountNo;
    map['bo_account_no'] = boAccountNo;
    map['bank_id'] = bankId;
    map['bank_name'] = bankName;
    map['branch_id'] = branchId;
    map['branch_name'] = branchName;
    map['branch_routing_no'] = branchRoutingNo;
    map['product_name'] = productName;
    map['dob'] = dob;
    return map;
  }
}
