import 'stock.dart';

class UnitApp {
  UnitApp({
    this.investorunitappid,
    this.investoraccountid,
    this.agentid,
    this.investortype,
    this.noofunits,
    this.nooflot,
    this.rate,
    this.navid,
    this.totalamount,
    this.paymode,
    this.bankaccid,
    this.chequeno,
    this.chequedate,
    this.pono,
    this.podate,
    this.ddno,
    this.dddate,
    this.sendtobank,
    this.honordishonorcancel,
    this.unitactivate,
    this.unitactivatedate,
    this.accountdetailsid,
    this.orgid,
    this.serialno,
    this.prefix,
    this.realno,
    this.centralserialno,
    this.sellsurrflag,
    this.poscommission,
    this.businessdate,
    this.recdate,
    this.msgstatus,
    this.dishonorreason,
    this.orgbranchid,
    this.backofficeentry,
    this.chequedebugPrint,
    this.generatefile,
    this.campaignperiod,
    this.sipscheduleid,
    this.chequeslipname,
    this.surrenderfilename,
    this.cdblstatus,
    this.exitloadsaleprice,
    this.regularunit,
    this.regularamount,
    this.exitloadunit,
    this.exitloadamount,
    this.stock,
  });

  UnitApp.fromJson(dynamic json) {
    investorunitappid = json['INVESTOR_UNIT_APP_ID'];
    investoraccountid = json['INVESTOR_ACCOUNT_ID'];
    agentid = json['AGENT_ID'];
    investortype = json['INVESTOR_TYPE'];
    noofunits = json['NO_OF_UNITS'];
    nooflot = json['NO_OF_LOT'];
    rate = json['RATE'];
    navid = json['NAV_ID'];
    totalamount = json['TOTAL_AMOUNT'];
    paymode = json['PAY_MODE'];
    bankaccid = json['BANK_ACC_ID'];
    chequeno = json['CHEQUE_NO'];
    chequedate = json['CHEQUE_DATE'];
    pono = json['PO_NO'];
    podate = json['PO_DATE'];
    ddno = json['DD_NO'];
    dddate = json['DD_DATE'];
    sendtobank = json['SEND_TO_BANK'];
    honordishonorcancel = json['HONOR_DISHONOR_CANCEL'];
    unitactivate = json['UNIT_ACTIVATE'];
    unitactivatedate = json['UNIT_ACTIVATE_DATE'];
    accountdetailsid = json['ACCOUNT_DETAILS_ID'];
    orgid = json['ORG_ID'];
    serialno = json['SERIAL_NO'];
    prefix = json['PREFIX'];
    realno = json['REAL_NO'];
    centralserialno = json['CENTRAL_SERIAL_NO'];
    sellsurrflag = json['SELL_SURR_FLAG'];
    poscommission = json['POS_COMMISSION'];
    businessdate = json['BUSINESS_DATE'];
    recdate = json['REC_DATE'];
    msgstatus = json['MSG_STATUS'];
    dishonorreason = json['DISHONOR_REASON'];
    orgbranchid = json['ORG_BRANCH_ID'];
    backofficeentry = json['BACK_OFFICE_ENTRY'];
    chequedebugPrint = json['CHEQUE_debugPrint'];
    generatefile = json['GENERATE_FILE'];
    campaignperiod = json['CAMPAIGN_PERIOD'];
    sipscheduleid = json['SIP_SCHEDULE_ID'];
    chequeslipname = json['CHEQUE_SLIP_NAME'];
    surrenderfilename = json['SURRENDER_FILE_NAME'];
    cdblstatus = json['CDBL_STATUS'];
    exitloadsaleprice = json['EXIT_LOAD_SALE_PRICE'];
    regularunit = json['REGULAR_UNIT'];
    regularamount = json['REGULAR_AMOUNT'];
    exitloadunit = json['EXIT_LOAD_UNIT'];
    exitloadamount = json['EXIT_LOAD_AMOUNT'];
    stock = json['stock'] != null ? Stock.fromJson(json['stock']) : null;
  }
  String? investorunitappid;
  String? investoraccountid;
  String? agentid;
  String? investortype;
  String? noofunits;
  String? nooflot;
  String? rate;
  String? navid;
  String? totalamount;
  dynamic paymode;
  String? bankaccid;
  dynamic chequeno;
  dynamic chequedate;
  dynamic pono;
  dynamic podate;
  dynamic ddno;
  dynamic dddate;
  String? sendtobank;
  String? honordishonorcancel;
  String? unitactivate;
  String? unitactivatedate;
  String? accountdetailsid;
  dynamic orgid;
  String? serialno;
  String? prefix;
  String? realno;
  String? centralserialno;
  String? sellsurrflag;
  dynamic poscommission;
  String? businessdate;
  String? recdate;
  String? msgstatus;
  dynamic dishonorreason;
  dynamic orgbranchid;
  String? backofficeentry;
  dynamic chequedebugPrint;
  dynamic generatefile;
  String? campaignperiod;
  dynamic sipscheduleid;
  dynamic chequeslipname;
  dynamic surrenderfilename;
  dynamic cdblstatus;
  dynamic exitloadsaleprice;
  dynamic regularunit;
  dynamic regularamount;
  dynamic exitloadunit;
  dynamic exitloadamount;
  Stock? stock;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['INVESTOR_UNIT_APP_ID'] = investorunitappid;
    map['INVESTOR_ACCOUNT_ID'] = investoraccountid;
    map['AGENT_ID'] = agentid;
    map['INVESTOR_TYPE'] = investortype;
    map['NO_OF_UNITS'] = noofunits;
    map['NO_OF_LOT'] = nooflot;
    map['RATE'] = rate;
    map['NAV_ID'] = navid;
    map['TOTAL_AMOUNT'] = totalamount;
    map['PAY_MODE'] = paymode;
    map['BANK_ACC_ID'] = bankaccid;
    map['CHEQUE_NO'] = chequeno;
    map['CHEQUE_DATE'] = chequedate;
    map['PO_NO'] = pono;
    map['PO_DATE'] = podate;
    map['DD_NO'] = ddno;
    map['DD_DATE'] = dddate;
    map['SEND_TO_BANK'] = sendtobank;
    map['HONOR_DISHONOR_CANCEL'] = honordishonorcancel;
    map['UNIT_ACTIVATE'] = unitactivate;
    map['UNIT_ACTIVATE_DATE'] = unitactivatedate;
    map['ACCOUNT_DETAILS_ID'] = accountdetailsid;
    map['ORG_ID'] = orgid;
    map['SERIAL_NO'] = serialno;
    map['PREFIX'] = prefix;
    map['REAL_NO'] = realno;
    map['CENTRAL_SERIAL_NO'] = centralserialno;
    map['SELL_SURR_FLAG'] = sellsurrflag;
    map['POS_COMMISSION'] = poscommission;
    map['BUSINESS_DATE'] = businessdate;
    map['REC_DATE'] = recdate;
    map['MSG_STATUS'] = msgstatus;
    map['DISHONOR_REASON'] = dishonorreason;
    map['ORG_BRANCH_ID'] = orgbranchid;
    map['BACK_OFFICE_ENTRY'] = backofficeentry;
    map['CHEQUE_debugPrint'] = chequedebugPrint;
    map['GENERATE_FILE'] = generatefile;
    map['CAMPAIGN_PERIOD'] = campaignperiod;
    map['SIP_SCHEDULE_ID'] = sipscheduleid;
    map['CHEQUE_SLIP_NAME'] = chequeslipname;
    map['SURRENDER_FILE_NAME'] = surrenderfilename;
    map['CDBL_STATUS'] = cdblstatus;
    map['EXIT_LOAD_SALE_PRICE'] = exitloadsaleprice;
    map['REGULAR_UNIT'] = regularunit;
    map['REGULAR_AMOUNT'] = regularamount;
    map['EXIT_LOAD_UNIT'] = exitloadunit;
    map['EXIT_LOAD_AMOUNT'] = exitloadamount;
    if (stock != null) {
      map['stock'] = stock?.toJson();
    }
    return map;
  }
}
