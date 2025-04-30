class Portfolio {
  Portfolio({
    // this.portfolioid,
    // this.fundtype,
    this.portfolioname,

    // this.portfoliosymbol,
    // this.portfoliocode,
    // this.fundsize,
    // this.sponsorscontributionfund,
    // this.preipoplacementfund,
    // this.initialpublicofferingfund,
    // this.issuanceofnewunitsfund,
    // this.facevalue,
    // this.lotsize,
    // this.initsubsstartdate,
    // this.initsubsenddate,
    // this.subsvaliditydays,
    // this.subsvaliditydate,
    // this.salescommissionamount,
    // this.salescommissiontype,
    // this.surrendercommissionamount,
    // this.surrendercommissiontype,
    // this.commissioncalculationon,
    // this.maxdividenddiscount,
    // this.brokercommission,
    // this.pcoacode,
    // this.recorddate,
    // this.regno,
    // this.sponsor,
    // this.assetmanager,
    // this.msgstatus,
    // this.trusteename,
    // this.custodianname,
    // this.isportfolio,
    // this.faceValue,
  });

  Portfolio.fromJson(dynamic json) {
    // portfolioid = json['PORTFOLIO_ID'];
    // fundtype = json['FUND_TYPE'];
    portfolioname = json['PORTFOLIO_NAME'];
    // portfoliosymbol = json['PORTFOLIO_SYMBOL'];
    // portfoliocode = json['PORTFOLIO_CODE'];
    // fundsize = json['FUND_SIZE'];
    // sponsorscontributionfund = json['SPONSORS_CONTRIBUTION_FUND'];
    // preipoplacementfund = json['PRE_IPO_PLACEMENT_FUND'];
    // initialpublicofferingfund = json['INITIAL_PUBLIC_OFFERING_FUND'];
    // issuanceofnewunitsfund = json['ISSUANCE_OF_NEW_UNITS_FUND'];
    // facevalue = json['FACE_VALUE'];
    // lotsize = json['LOT_SIZE'];
    // initsubsstartdate = json['INIT_SUBS_START_DATE'];
    // initsubsenddate = json['INIT_SUBS_END_DATE'];
    // subsvaliditydays = json['SUBS_VALIDITY_DAYS'];
    // subsvaliditydate = json['SUBS_VALIDITY_DATE'];
    // salescommissionamount = json['SALES_COMMISSION_AMOUNT'];
    // salescommissiontype = json['SALES_COMMISSION_TYPE'];
    // surrendercommissionamount = json['SURRENDER_COMMISSION_AMOUNT'];
    // surrendercommissiontype = json['SURRENDER_COMMISSION_TYPE'];
    // commissioncalculationon = json['COMMISSION_CALCULATION_ON'];
    // maxdividenddiscount = json['MAX_DIVIDEND_DISCOUNT'];
    // brokercommission = json['BROKER_COMMISSION'];
    // pcoacode = json['P_COA_CODE'];
    // recorddate = json['RECORD_DATE'];
    // regno = json['REG_NO'];
    // sponsor = json['SPONSOR'];
    // assetmanager = json['ASSET_MANAGER'];
    // msgstatus = json['MSG_STATUS'];
    // trusteename = json['TRUSTEE_NAME'];
    // custodianname = json['CUSTODIAN_NAME'];
    // isportfolio = json['IS_PORTFOLIO'];
    // faceValue = json['face_value'] != null ? FaceValue.fromJson(json['faceValue']) : null;
  }

  ///Used variable
  String? portfolioname;

  ///unused variable
  // String? portfolioid;
  // String? fundtype;

  // String? portfoliosymbol;
  // String? portfoliocode;
  // String? fundsize;
  // String? sponsorscontributionfund;
  // String? preipoplacementfund;
  // String? initialpublicofferingfund;
  // String? issuanceofnewunitsfund;
  // String? facevalue;
  // String? lotsize;
  // String? initsubsstartdate;
  // String? initsubsenddate;
  // String? subsvaliditydays;
  // dynamic subsvaliditydate;
  // dynamic salescommissionamount;
  // dynamic salescommissiontype;
  // dynamic surrendercommissionamount;
  // dynamic surrendercommissiontype;
  // dynamic commissioncalculationon;
  // dynamic maxdividenddiscount;
  // dynamic brokercommission;
  // String? pcoacode;
  // String? recorddate;
  // String? regno;
  // String? sponsor;
  // String? assetmanager;
  // String? msgstatus;
  // String? trusteename;
  // String? custodianname;
  // String? isportfolio;
  // FaceValue? faceValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['PORTFOLIO_ID'] = portfolioid;
    // map['FUND_TYPE'] = fundtype;
    map['PORTFOLIO_NAME'] = portfolioname;
    // map['PORTFOLIO_SYMBOL'] = portfoliosymbol;
    // map['PORTFOLIO_CODE'] = portfoliocode;
    // map['FUND_SIZE'] = fundsize;
    // map['SPONSORS_CONTRIBUTION_FUND'] = sponsorscontributionfund;
    // map['PRE_IPO_PLACEMENT_FUND'] = preipoplacementfund;
    // map['INITIAL_PUBLIC_OFFERING_FUND'] = initialpublicofferingfund;
    // map['ISSUANCE_OF_NEW_UNITS_FUND'] = issuanceofnewunitsfund;
    // map['FACE_VALUE'] = facevalue;
    // map['LOT_SIZE'] = lotsize;
    // map['INIT_SUBS_START_DATE'] = initsubsstartdate;
    // map['INIT_SUBS_END_DATE'] = initsubsenddate;
    // map['SUBS_VALIDITY_DAYS'] = subsvaliditydays;
    // map['SUBS_VALIDITY_DATE'] = subsvaliditydate;
    // map['SALES_COMMISSION_AMOUNT'] = salescommissionamount;
    // map['SALES_COMMISSION_TYPE'] = salescommissiontype;
    // map['SURRENDER_COMMISSION_AMOUNT'] = surrendercommissionamount;
    // map['SURRENDER_COMMISSION_TYPE'] = surrendercommissiontype;
    // map['COMMISSION_CALCULATION_ON'] = commissioncalculationon;
    // map['MAX_DIVIDEND_DISCOUNT'] = maxdividenddiscount;
    // map['BROKER_COMMISSION'] = brokercommission;
    // map['P_COA_CODE'] = pcoacode;
    // map['RECORD_DATE'] = recorddate;
    // map['REG_NO'] = regno;
    // map['SPONSOR'] = sponsor;
    // map['ASSET_MANAGER'] = assetmanager;
    // map['MSG_STATUS'] = msgstatus;
    // map['TRUSTEE_NAME'] = trusteename;
    // map['CUSTODIAN_NAME'] = custodianname;
    // map['IS_PORTFOLIO'] = isportfolio;
    // if (faceValue != null) {
    //   map['face_value'] = faceValue?.toJson();
    // }
    return map;
  }
}
