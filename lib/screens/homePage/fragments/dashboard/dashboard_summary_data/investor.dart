import 'accounts.dart';

class Investor {
  Investor({
    this.investordetailsid,
    this.operationmodeid,
    this.relationid,
    this.nationalityid,
    this.occupationid,
    this.orgbranchid,
    this.cityid,
    this.portfoliocode,
    this.tradecode,
    this.investorname,
    this.registrationnumber,
    this.registrationdate,
    this.fathername,
    this.mothername,
    this.spousename,
    this.residency,
    this.nid,
    this.boaccountno,
    this.passportno,
    this.ppdateofissue,
    this.ppvalidity,
    this.dob,
    this.monthlyincome,
    this.bankaccountno,
    this.mailingaddress,
    this.permanentaddress,
    this.telephoneoffice,
    this.telephoneresidential,
    this.mobile,
    this.fax,
    this.email,
    this.applicantsign,
    this.applicantphoto,
    this.introducername,
    this.introduceraddress,
    this.introducersign,
    this.ipano,
    this.institutionname,
    this.instshortname,
    this.typeofinstitution,
    this.companyregno,
    this.insttinno,
    this.instceoname,
    this.modeofoperation,
    this.moa,
    this.boardres,
    this.poa,
    this.tin,
    this.certincorporation,
    this.src,
    this.td,
    this.investorcompanies,
    this.accountsuspend,
    this.accountclose,
    this.accountenabledisable,
    this.businessdate,
    this.recorddate,
    this.operateby,
    this.nidcopy,
    this.instceophoto,
    this.investorreportingcycle,
    this.investorlastname,
    this.investorshortname,
    this.regno,
    this.portfolioid,
    this.dividendtype,
    this.msgstatus,
    this.honorific,
    this.gender,
    this.religion,
    this.totalsipamount,
    this.boaccountnocopy,
    this.bankaccountcopy,
    this.digitalrequest,
    this.digitalstatus,
    this.orgid,
    this.accounts,
  });

  Investor.fromJson(dynamic json) {
    investordetailsid = json['INVESTOR_DETAILS_ID'];
    operationmodeid = json['OPERATION_MODE_ID'];
    relationid = json['RELATION_ID'];
    nationalityid = json['NATIONALITY_ID'];
    occupationid = json['OCCUPATION_ID'];
    orgbranchid = json['ORG_BRANCH_ID'];
    cityid = json['CITY_ID'];
    portfoliocode = json['PORTFOLIO_CODE'];
    tradecode = json['TRADE_CODE'];
    investorname = json['INVESTOR_NAME'];
    registrationnumber = json['REGISTRATION_NUMBER'];
    registrationdate = json['REGISTRATION_DATE'];
    fathername = json['FATHER_NAME'];
    mothername = json['MOTHER_NAME'];
    spousename = json['SPOUSE_NAME'];
    residency = json['RESIDENCY'];
    nid = json['NID'];
    boaccountno = json['BO_ACCOUNT_NO'];
    passportno = json['PASSPORT_NO'];
    ppdateofissue = json['PP_DATE_OF_ISSUE'];
    ppvalidity = json['PP_VALIDITY'];
    dob = json['DOB'];
    monthlyincome = json['MONTHLY_INCOME'];
    bankaccountno = json['BANK_ACCOUNT_NO'];
    mailingaddress = json['MAILING_ADDRESS'];
    permanentaddress = json['PERMANENT_ADDRESS'];
    telephoneoffice = json['TELEPHONE_OFFICE'];
    telephoneresidential = json['TELEPHONE_RESIDENTIAL'];
    mobile = json['MOBILE'];
    fax = json['FAX'];
    email = json['EMAIL'];
    applicantsign = json['APPLICANT_SIGN'];
    applicantphoto = json['APPLICANT_PHOTO'];
    introducername = json['INTRODUCER_NAME'];
    introduceraddress = json['INTRODUCER_ADDRESS'];
    introducersign = json['INTRODUCER_SIGN'];
    ipano = json['IPA_NO'];
    institutionname = json['INSTITUTION_NAME'];
    instshortname = json['INST_SHORT_NAME'];
    typeofinstitution = json['TYPE_OF_INSTITUTION'];
    companyregno = json['COMPANY_REG_NO'];
    insttinno = json['INST_TIN_NO'];
    instceoname = json['INST_CEO_NAME'];
    modeofoperation = json['MODE_OF_OPERATION'];
    moa = json['MOA'];
    boardres = json['BOARD_RES'];
    poa = json['POA'];
    tin = json['TIN'];
    certincorporation = json['CERT_INCORPORATION'];
    src = json['SRC'];
    td = json['TD'];
    investorcompanies = json['INVESTOR_COMPANIES'];
    accountsuspend = json['ACCOUNT_SUSPEND'];
    accountclose = json['ACCOUNT_CLOSE'];
    accountenabledisable = json['ACCOUNT_ENABLE_DISABLE'];
    businessdate = json['BUSINESS_DATE'];
    recorddate = json['RECORD_DATE'];
    operateby = json['OPERATE_BY'];
    nidcopy = json['NID_COPY'];
    instceophoto = json['INST_CEO_PHOTO'];
    investorreportingcycle = json['INVESTOR_REPORTING_CYCLE'];
    investorlastname = json['INVESTOR_LAST_NAME'];
    investorshortname = json['INVESTOR_SHORT_NAME'];
    regno = json['REG_NO'];
    portfolioid = json['PORTFOLIO_ID'];
    dividendtype = json['DIVIDEND_TYPE'];
    msgstatus = json['MSG_STATUS'];
    honorific = json['HONORIFIC'];
    gender = json['GENDER'];
    religion = json['RELIGION'];
    totalsipamount = json['TOTAL_SIP_AMOUNT'];
    boaccountnocopy = json['BO_ACCOUNT_NO_COPY'];
    bankaccountcopy = json['BANK_ACCOUNT_COPY'];
    digitalrequest = json['DIGITAL_REQUEST'];
    digitalstatus = json['DIGITAL_STATUS'];
    orgid = json['ORG_ID'];
    if (json['accounts'] != null) {
      accounts = [];
      json['accounts'].forEach((v) {
        accounts?.add(Accounts.fromJson(v));
      });
    }
  }
  String? investordetailsid;
  String? operationmodeid;
  dynamic relationid;
  String? nationalityid;
  String? occupationid;
  dynamic orgbranchid;
  String? cityid;
  String? portfoliocode;
  dynamic tradecode;
  String? investorname;
  dynamic registrationnumber;
  dynamic registrationdate;
  String? fathername;
  String? mothername;
  String? spousename;
  String? residency;
  String? nid;
  String? boaccountno;
  String? passportno;
  dynamic ppdateofissue;
  dynamic ppvalidity;
  String? dob;
  String? monthlyincome;
  String? bankaccountno;
  String? mailingaddress;
  String? permanentaddress;
  String? telephoneoffice;
  String? telephoneresidential;
  String? mobile;
  String? fax;
  String? email;
  String? applicantsign;
  String? applicantphoto;
  String? introducername;
  String? introduceraddress;
  String? introducersign;
  String? ipano;
  dynamic institutionname;
  dynamic instshortname;
  dynamic typeofinstitution;
  dynamic companyregno;
  String? insttinno;
  dynamic instceoname;
  dynamic modeofoperation;
  dynamic moa;
  dynamic boardres;
  dynamic poa;
  String? tin;
  dynamic certincorporation;
  dynamic src;
  dynamic td;
  String? investorcompanies;
  String? accountsuspend;
  String? accountclose;
  String? accountenabledisable;
  String? businessdate;
  String? recorddate;
  String? operateby;
  String? nidcopy;
  dynamic instceophoto;
  dynamic investorreportingcycle;
  String? investorlastname;
  String? investorshortname;
  dynamic regno;
  dynamic portfolioid;
  String? dividendtype;
  String? msgstatus;
  String? honorific;
  String? gender;
  String? religion;
  dynamic totalsipamount;
  String? boaccountnocopy;
  dynamic bankaccountcopy;
  dynamic digitalrequest;
  dynamic digitalstatus;
  dynamic orgid;
  List<Accounts>? accounts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['INVESTOR_DETAILS_ID'] = investordetailsid;
    map['OPERATION_MODE_ID'] = operationmodeid;
    map['RELATION_ID'] = relationid;
    map['NATIONALITY_ID'] = nationalityid;
    map['OCCUPATION_ID'] = occupationid;
    map['ORG_BRANCH_ID'] = orgbranchid;
    map['CITY_ID'] = cityid;
    map['PORTFOLIO_CODE'] = portfoliocode;
    map['TRADE_CODE'] = tradecode;
    map['INVESTOR_NAME'] = investorname;
    map['REGISTRATION_NUMBER'] = registrationnumber;
    map['REGISTRATION_DATE'] = registrationdate;
    map['FATHER_NAME'] = fathername;
    map['MOTHER_NAME'] = mothername;
    map['SPOUSE_NAME'] = spousename;
    map['RESIDENCY'] = residency;
    map['NID'] = nid;
    map['BO_ACCOUNT_NO'] = boaccountno;
    map['PASSPORT_NO'] = passportno;
    map['PP_DATE_OF_ISSUE'] = ppdateofissue;
    map['PP_VALIDITY'] = ppvalidity;
    map['DOB'] = dob;
    map['MONTHLY_INCOME'] = monthlyincome;
    map['BANK_ACCOUNT_NO'] = bankaccountno;
    map['MAILING_ADDRESS'] = mailingaddress;
    map['PERMANENT_ADDRESS'] = permanentaddress;
    map['TELEPHONE_OFFICE'] = telephoneoffice;
    map['TELEPHONE_RESIDENTIAL'] = telephoneresidential;
    map['MOBILE'] = mobile;
    map['FAX'] = fax;
    map['EMAIL'] = email;
    map['APPLICANT_SIGN'] = applicantsign;
    map['APPLICANT_PHOTO'] = applicantphoto;
    map['INTRODUCER_NAME'] = introducername;
    map['INTRODUCER_ADDRESS'] = introduceraddress;
    map['INTRODUCER_SIGN'] = introducersign;
    map['IPA_NO'] = ipano;
    map['INSTITUTION_NAME'] = institutionname;
    map['INST_SHORT_NAME'] = instshortname;
    map['TYPE_OF_INSTITUTION'] = typeofinstitution;
    map['COMPANY_REG_NO'] = companyregno;
    map['INST_TIN_NO'] = insttinno;
    map['INST_CEO_NAME'] = instceoname;
    map['MODE_OF_OPERATION'] = modeofoperation;
    map['MOA'] = moa;
    map['BOARD_RES'] = boardres;
    map['POA'] = poa;
    map['TIN'] = tin;
    map['CERT_INCORPORATION'] = certincorporation;
    map['SRC'] = src;
    map['TD'] = td;
    map['INVESTOR_COMPANIES'] = investorcompanies;
    map['ACCOUNT_SUSPEND'] = accountsuspend;
    map['ACCOUNT_CLOSE'] = accountclose;
    map['ACCOUNT_ENABLE_DISABLE'] = accountenabledisable;
    map['BUSINESS_DATE'] = businessdate;
    map['RECORD_DATE'] = recorddate;
    map['OPERATE_BY'] = operateby;
    map['NID_COPY'] = nidcopy;
    map['INST_CEO_PHOTO'] = instceophoto;
    map['INVESTOR_REPORTING_CYCLE'] = investorreportingcycle;
    map['INVESTOR_LAST_NAME'] = investorlastname;
    map['INVESTOR_SHORT_NAME'] = investorshortname;
    map['REG_NO'] = regno;
    map['PORTFOLIO_ID'] = portfolioid;
    map['DIVIDEND_TYPE'] = dividendtype;
    map['MSG_STATUS'] = msgstatus;
    map['HONORIFIC'] = honorific;
    map['GENDER'] = gender;
    map['RELIGION'] = religion;
    map['TOTAL_SIP_AMOUNT'] = totalsipamount;
    map['BO_ACCOUNT_NO_COPY'] = boaccountnocopy;
    map['BANK_ACCOUNT_COPY'] = bankaccountcopy;
    map['DIGITAL_REQUEST'] = digitalrequest;
    map['DIGITAL_STATUS'] = digitalstatus;
    map['ORG_ID'] = orgid;
    if (accounts != null) {
      map['accounts'] = accounts?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
