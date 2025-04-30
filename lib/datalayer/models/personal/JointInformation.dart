class JointInformation {
  JointInformation({
    this.name,
    this.spouseName,
    this.fatherName,
    this.motherName,
    this.residency,
    this.nid,
    this.boAccountNo,
    this.passportNo,
    this.monthlyIncome,
    this.bankAccountNo,
    this.occupation,
    this.nationality,
    this.mailingAddress,
    this.permanentAddress,
    this.telephoneOffice,
    this.telephoneResident,
    this.mobile,
    this.fax,
    this.email,
    this.relationWithPrincipalApplicant,
    this.dateOfBirth,
    this.city,
  });

  JointInformation.fromJson(dynamic json) {
    name = json['name'];
    spouseName = json['spouse_name'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    residency = json['residency'];
    nid = json['nid'];
    boAccountNo = json['bo_account_no'];
    passportNo = json['passport_no'];
    monthlyIncome = json['monthly_income'];
    bankAccountNo = json['bank_account_no'];
    occupation = json['occupation'];
    nationality = json['nationality'];
    mailingAddress = json['mailing_address'];
    permanentAddress = json['permanent_address'];
    telephoneOffice = json['telephone_office'];
    telephoneResident = json['telephone_resident'];
    mobile = json['mobile'];
    fax = json['fax'];
    email = json['email'];
    relationWithPrincipalApplicant = json['relation_with_principal_applicant'];
    dateOfBirth = json['date_of_birth'];
    city = json['city'];
  }
  String? name;
  String? spouseName;
  String? fatherName;
  String? motherName;
  String? residency;
  String? nid;
  String? boAccountNo;
  String? passportNo;
  String? monthlyIncome;
  String? bankAccountNo;
  String? occupation;
  String? nationality;
  String? mailingAddress;
  String? permanentAddress;
  String? telephoneOffice;
  String? telephoneResident;
  String? mobile;
  String? fax;
  String? email;
  String? relationWithPrincipalApplicant;
  String? dateOfBirth;
  String? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['spouse_name'] = spouseName;
    map['father_name'] = fatherName;
    map['mother_name'] = motherName;
    map['residency'] = residency;
    map['nid'] = nid;
    map['bo_account_no'] = boAccountNo;
    map['passport_no'] = passportNo;
    map['monthly_income'] = monthlyIncome;
    map['bank_account_no'] = bankAccountNo;
    map['occupation'] = occupation;
    map['nationality'] = nationality;
    map['mailing_address'] = mailingAddress;
    map['permanent_address'] = permanentAddress;
    map['telephone_office'] = telephoneOffice;
    map['telephone_resident'] = telephoneResident;
    map['mobile'] = mobile;
    map['fax'] = fax;
    map['email'] = email;
    map['relation_with_principal_applicant'] = relationWithPrincipalApplicant;
    map['date_of_birth'] = dateOfBirth;
    map['city'] = city;
    return map;
  }
}
