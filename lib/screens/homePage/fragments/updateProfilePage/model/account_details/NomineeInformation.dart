class NomineeInformation {
  NomineeInformation({
    this.nomineeId,
    this.nomineeName,
    this.nomineeDateOfBirth,
    this.nomineeFatherName,
    this.nomineeMotherName,
    this.nomineeSharePercentage,
    this.nomineeSharePercentageNumber,
    this.nomineeRelationId,
    this.nomineeContactNo,
    this.nomineeNidPassportNo,
    this.nomineePhoto,
    this.nomineeSign,
    this.nomineeNidPhoto,
    this.nomineeProfileImage,
    this.nomineeSignImage,
    this.nomineeNidImage,
  });

  NomineeInformation.fromJson(dynamic json) {
    nomineeId = json['nominee_id'];
    nomineeName = json['nominee_name'];
    nomineeDateOfBirth = json['nominee_date_of_birth'];
    nomineeFatherName = json['nominee_father_name'];
    nomineeMotherName = json['nominee_mother_name'];
    nomineeSharePercentage = json['nominee_share_percentage'].toString();
    nomineeSharePercentageNumber = json['nominee_share_percentage_number'];
    nomineeRelationId = json['nominee_relation_id'];
    nomineeContactNo = json['nominee_contact_no'];
    nomineeNidPassportNo = json['nominee_nid_passport_no'];
    nomineePhoto = json['nominee_photo'];
    nomineeSign = json['nominee_sign'];
    nomineeNidPhoto = json['nominee_nid_photo'];
    nomineeProfileImage = json['nominee_profile_image'];
    nomineeSignImage = json['nominee_sign_image'];
    nomineeNidImage = json['nominee_nid_image'];
  }
  int? nomineeId;
  String? nomineeName;
  String? nomineeDateOfBirth;
  String? nomineeFatherName;
  String? nomineeMotherName;
  String? nomineeSharePercentage;
  int? nomineeSharePercentageNumber;
  String? nomineeRelationId;
  String? nomineeContactNo;
  String? nomineeNidPassportNo;
  String? nomineePhoto;
  String? nomineeSign;
  String? nomineeNidPhoto;
  String? nomineeProfileImage;
  String? nomineeSignImage;
  String? nomineeNidImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nominee_id'] = nomineeId;
    map['nominee_name'] = nomineeName;
    map['nominee_date_of_birth'] = nomineeDateOfBirth;
    map['nominee_father_name'] = nomineeFatherName;
    map['nominee_mother_name'] = nomineeMotherName;
    map['nominee_share_percentage'] = nomineeSharePercentage;
    map['nominee_share_percentage_number'] = nomineeSharePercentageNumber;
    map['nominee_relation_id'] = nomineeRelationId;
    map['nominee_contact_no'] = nomineeContactNo;
    map['nominee_nid_passport_no'] = nomineeNidPassportNo;
    map['nominee_photo'] = nomineePhoto;
    map['nominee_sign'] = nomineeSign;
    map['nominee_nid_photo'] = nomineeNidPhoto;
    map['nominee_profile_image'] = nomineeProfileImage;
    map['nominee_sign_image'] = nomineeSignImage;
    map['nominee_nid_image'] = nomineeNidImage;
    return map;
  }
}
