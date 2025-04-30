class InvestorInformation {
  InvestorInformation({
    this.investorAccountNo,
    this.accountType,
    this.subAccountType,
    this.bankName,
    this.branchName,
    this.bankAccountNo,
    this.connectingBranch,
    this.operationType,
    this.openingDate,
    this.specialInstruction,
    this.introducerName,
    this.introducerAccount,
    this.investorName,
    this.fatherName,
    this.spouseName,
    this.occupation,
    this.motherName,
    this.businessAddress,
    this.dateOfBirth,
    this.nationality,
    this.officePhoneNo,
    this.homePhoneNo,
    this.mobileNo,
    this.email,
    this.identityNo,
    this.homeAddress,
    this.passportNo,
    this.issuePlace,
    this.validTill,
    this.faxNo,
    this.telex,
    this.tin,
    this.companyBranch,
    this.boAccountNo,
    this.applicantPhoto,
  });

  InvestorInformation.fromJson(dynamic json) {
    investorAccountNo = json['investor_account_no'];
    accountType = json['account_type'];
    subAccountType = json['sub_account_type'];
    bankName = json['bank_name'];
    branchName = json['branch_name'];
    bankAccountNo = json['bank_account_no'];
    connectingBranch = json['connecting_branch'];
    operationType = json['operation_type'];
    openingDate = json['opening_date'];
    specialInstruction = json['special_instruction'];
    introducerName = json['introducer_name'];
    introducerAccount = json['introducer_account'];
    investorName = json['investor_name'];
    fatherName = json['father_name'];
    spouseName = json['spouse_name'];
    occupation = json['occupation'];
    motherName = json['mother_name'];
    businessAddress = json['business_address'];
    dateOfBirth = json['date_of_birth'];
    nationality = json['nationality'];
    officePhoneNo = json['office_phone_no'];
    homePhoneNo = json['home_phone_no'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    identityNo = json['identity_no'];
    homeAddress = json['home_address'];
    passportNo = json['passport_no'];
    issuePlace = json['issue_place'];
    validTill = json['valid_till'];
    faxNo = json['fax_no'];
    telex = json['telex'];
    tin = json['tin'];
    companyBranch = json['company_branch'];
    boAccountNo = json['bo_account_no'];
    applicantPhoto = json['applicant_photo'];
  }
  String? investorAccountNo;
  String? accountType;
  dynamic subAccountType;
  String? bankName;
  String? branchName;
  String? bankAccountNo;
  dynamic connectingBranch;
  String? operationType;
  String? openingDate;
  dynamic specialInstruction;
  dynamic introducerName;
  dynamic introducerAccount;
  String? investorName;
  String? fatherName;
  dynamic spouseName;
  String? occupation;
  String? motherName;
  String? businessAddress;
  String? dateOfBirth;
  String? nationality;
  dynamic officePhoneNo;
  dynamic homePhoneNo;
  String? mobileNo;
  String? email;
  String? identityNo;
  String? homeAddress;
  dynamic passportNo;
  dynamic issuePlace;
  String? validTill;
  dynamic faxNo;
  dynamic telex;
  dynamic tin;
  dynamic companyBranch;
  String? boAccountNo;
  String? applicantPhoto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['investor_account_no'] = investorAccountNo;
    map['account_type'] = accountType;
    map['sub_account_type'] = subAccountType;
    map['bank_name'] = bankName;
    map['branch_name'] = branchName;
    map['bank_account_no'] = bankAccountNo;
    map['connecting_branch'] = connectingBranch;
    map['operation_type'] = operationType;
    map['opening_date'] = openingDate;
    map['special_instruction'] = specialInstruction;
    map['introducer_name'] = introducerName;
    map['introducer_account'] = introducerAccount;
    map['investor_name'] = investorName;
    map['father_name'] = fatherName;
    map['spouse_name'] = spouseName;
    map['occupation'] = occupation;
    map['mother_name'] = motherName;
    map['business_address'] = businessAddress;
    map['date_of_birth'] = dateOfBirth;
    map['nationality'] = nationality;
    map['office_phone_no'] = officePhoneNo;
    map['home_phone_no'] = homePhoneNo;
    map['mobile_no'] = mobileNo;
    map['email'] = email;
    map['identity_no'] = identityNo;
    map['home_address'] = homeAddress;
    map['passport_no'] = passportNo;
    map['issue_place'] = issuePlace;
    map['valid_till'] = validTill;
    map['fax_no'] = faxNo;
    map['telex'] = telex;
    map['tin'] = tin;
    map['company_branch'] = companyBranch;
    map['bo_account_no'] = boAccountNo;
    map['applicant_photo'] = applicantPhoto;
    return map;
  }
}
