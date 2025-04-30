import 'investment_type.dart';
import 'portfolio.dart';
import 'unit_app.dart';

class Accounts {
  Accounts({
    this.investoraccountid,
    this.investordetailsid,
    this.jainvestordetailsid,
    this.investmenttypeid,
    this.portfolioid,
    this.orgid,
    this.orgbranchid,
    this.bankaccountno,
    this.msgstatus,
    this.businessdate,
    this.recorddate,
    this.operateby,
    this.dividendtype,
    this.investorregno,
    this.boaccountno,
    this.monthlyinstallment,
    this.installmentsize,
    this.installmenttenor,
    this.tenurematuredate,
    this.installmentperiodicity,
    this.installmentdate,
    this.installmentcollectionmode,
    this.siplockinperiod,
    this.sipautorenewal,
    this.insno,
    this.insdate,
    this.instalmentday,
    this.smsnotification,
    this.emailnotification,
    this.jasmsnotification,
    this.jaemailnotification,
    this.installmentday,
    this.accountdetailsid,
    this.virtualaccountnumber,
    this.financialgoal,
    this.financialgoalbyyear,
    this.saleproceedsoption,
    this.insurancestatus,
    this.insurancecoverageamount,
    this.insurancepremium,
    this.insurancetenure,
    this.insurancestartdate,
    this.tax,
    this.bankaccountname,
    this.accountstatus,
    this.refno,
    this.agentid,
    this.jointAccount,
    this.investmentType,
    this.portfolio,
    this.unitApp,
  });

  Accounts.fromJson(dynamic json) {
    investoraccountid = json['INVESTOR_ACCOUNT_ID'];
    investordetailsid = json['INVESTOR_DETAILS_ID'];
    jainvestordetailsid = json['JA_INVESTOR_DETAILS_ID'];
    investmenttypeid = json['INVESTMENT_TYPE_ID'];
    portfolioid = json['PORTFOLIO_ID'];
    orgid = json['ORG_ID'];
    orgbranchid = json['ORG_BRANCH_ID'];
    bankaccountno = json['BANK_ACCOUNT_NO'];
    msgstatus = json['MSG_STATUS'];
    businessdate = json['BUSINESS_DATE'];
    recorddate = json['RECORD_DATE'];
    operateby = json['OPERATE_BY'];
    dividendtype = json['DIVIDEND_TYPE'];
    investorregno = json['INVESTOR_REG_NO'];
    boaccountno = json['BO_ACCOUNT_NO'];
    monthlyinstallment = json['MONTHLY_INSTALLMENT'];
    installmentsize = json['INSTALLMENT_SIZE'];
    installmenttenor = json['INSTALLMENT_TENOR'];
    tenurematuredate = json['TENURE_MATURE_DATE'];
    installmentperiodicity = json['INSTALLMENT_PERIODICITY'];
    installmentdate = json['INSTALLMENT_DATE'];
    installmentcollectionmode = json['INSTALLMENT_COLLECTION_MODE'];
    siplockinperiod = json['SIP_LOCK_IN_PERIOD'];
    sipautorenewal = json['SIP_AUTO_RENEWAL'];
    insno = json['INS_NO'];
    insdate = json['INS_DATE'];
    instalmentday = json['INSTALMENT_DAY'];
    smsnotification = json['SMS_NOTIFICATION'];
    emailnotification = json['EMAIL_NOTIFICATION'];
    jasmsnotification = json['JA_SMS_NOTIFICATION'];
    jaemailnotification = json['JA_EMAIL_NOTIFICATION'];
    installmentday = json['INSTALLMENT_DAY'];
    accountdetailsid = json['ACCOUNT_DETAILS_ID'];
    virtualaccountnumber = json['VIRTUAL_ACCOUNT_NUMBER'];
    financialgoal = json['FINANCIAL_GOAL'];
    financialgoalbyyear = json['FINANCIAL_GOAL_BY_YEAR'];
    saleproceedsoption = json['SALE_PROCEEDS_OPTION'];
    insurancestatus = json['INSURANCE_STATUS'];
    insurancecoverageamount = json['INSURANCE_COVERAGE_AMOUNT'];
    insurancepremium = json['INSURANCE_PREMIUM'];
    insurancetenure = json['INSURANCE_TENURE'];
    insurancestartdate = json['INSURANCE_START_DATE'];
    tax = json['TAX'];
    bankaccountname = json['BANK_ACCOUNT_NAME'];
    accountstatus = json['ACCOUNT_STATUS'];
    refno = json['REF_NO'];
    agentid = json['AGENT_ID'];
    jointAccount = json['joint_account'];
    investmentType =
        json['investment_type'] != null
            ? InvestmentType.fromJson(json['investmentType'])
            : null;
    portfolio =
        json['portfolio'] != null
            ? Portfolio.fromJson(json['portfolio'])
            : null;
    if (json['unit_app'] != null) {
      unitApp = [];
      json['unit_app'].forEach((v) {
        unitApp?.add(UnitApp.fromJson(v));
      });
    }
  }
  String? investoraccountid;
  String? investordetailsid;
  dynamic jainvestordetailsid;
  String? investmenttypeid;
  String? portfolioid;
  String? orgid;
  String? orgbranchid;
  String? bankaccountno;
  String? msgstatus;
  String? businessdate;
  String? recorddate;
  String? operateby;
  String? dividendtype;
  String? investorregno;
  String? boaccountno;
  dynamic monthlyinstallment;
  dynamic installmentsize;
  dynamic installmenttenor;
  dynamic tenurematuredate;
  dynamic installmentperiodicity;
  String? installmentdate;
  dynamic installmentcollectionmode;
  dynamic siplockinperiod;
  String? sipautorenewal;
  dynamic insno;
  String? insdate;
  dynamic instalmentday;
  String? smsnotification;
  String? emailnotification;
  String? jasmsnotification;
  String? jaemailnotification;
  dynamic installmentday;
  dynamic accountdetailsid;
  dynamic virtualaccountnumber;
  dynamic financialgoal;
  dynamic financialgoalbyyear;
  String? saleproceedsoption;
  dynamic insurancestatus;
  dynamic insurancecoverageamount;
  dynamic insurancepremium;
  dynamic insurancetenure;
  String? insurancestartdate;
  String? tax;
  dynamic bankaccountname;
  dynamic accountstatus;
  dynamic refno;
  String? agentid;
  dynamic jointAccount;
  InvestmentType? investmentType;
  Portfolio? portfolio;
  List<UnitApp>? unitApp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['INVESTOR_ACCOUNT_ID'] = investoraccountid;
    map['INVESTOR_DETAILS_ID'] = investordetailsid;
    map['JA_INVESTOR_DETAILS_ID'] = jainvestordetailsid;
    map['INVESTMENT_TYPE_ID'] = investmenttypeid;
    map['PORTFOLIO_ID'] = portfolioid;
    map['ORG_ID'] = orgid;
    map['ORG_BRANCH_ID'] = orgbranchid;
    map['BANK_ACCOUNT_NO'] = bankaccountno;
    map['MSG_STATUS'] = msgstatus;
    map['BUSINESS_DATE'] = businessdate;
    map['RECORD_DATE'] = recorddate;
    map['OPERATE_BY'] = operateby;
    map['DIVIDEND_TYPE'] = dividendtype;
    map['INVESTOR_REG_NO'] = investorregno;
    map['BO_ACCOUNT_NO'] = boaccountno;
    map['MONTHLY_INSTALLMENT'] = monthlyinstallment;
    map['INSTALLMENT_SIZE'] = installmentsize;
    map['INSTALLMENT_TENOR'] = installmenttenor;
    map['TENURE_MATURE_DATE'] = tenurematuredate;
    map['INSTALLMENT_PERIODICITY'] = installmentperiodicity;
    map['INSTALLMENT_DATE'] = installmentdate;
    map['INSTALLMENT_COLLECTION_MODE'] = installmentcollectionmode;
    map['SIP_LOCK_IN_PERIOD'] = siplockinperiod;
    map['SIP_AUTO_RENEWAL'] = sipautorenewal;
    map['INS_NO'] = insno;
    map['INS_DATE'] = insdate;
    map['INSTALMENT_DAY'] = instalmentday;
    map['SMS_NOTIFICATION'] = smsnotification;
    map['EMAIL_NOTIFICATION'] = emailnotification;
    map['JA_SMS_NOTIFICATION'] = jasmsnotification;
    map['JA_EMAIL_NOTIFICATION'] = jaemailnotification;
    map['INSTALLMENT_DAY'] = installmentday;
    map['ACCOUNT_DETAILS_ID'] = accountdetailsid;
    map['VIRTUAL_ACCOUNT_NUMBER'] = virtualaccountnumber;
    map['FINANCIAL_GOAL'] = financialgoal;
    map['FINANCIAL_GOAL_BY_YEAR'] = financialgoalbyyear;
    map['SALE_PROCEEDS_OPTION'] = saleproceedsoption;
    map['INSURANCE_STATUS'] = insurancestatus;
    map['INSURANCE_COVERAGE_AMOUNT'] = insurancecoverageamount;
    map['INSURANCE_PREMIUM'] = insurancepremium;
    map['INSURANCE_TENURE'] = insurancetenure;
    map['INSURANCE_START_DATE'] = insurancestartdate;
    map['TAX'] = tax;
    map['BANK_ACCOUNT_NAME'] = bankaccountname;
    map['ACCOUNT_STATUS'] = accountstatus;
    map['REF_NO'] = refno;
    map['AGENT_ID'] = agentid;
    map['joint_account'] = jointAccount;
    if (investmentType != null) {
      map['investment_type'] = investmentType?.toJson();
    }
    if (portfolio != null) {
      map['portfolio'] = portfolio?.toJson();
    }
    if (unitApp != null) {
      map['unit_app'] = unitApp?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
