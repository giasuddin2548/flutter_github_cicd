class FiscalYear {
  FiscalYear({this.fiscalYearId, this.fiscalYear});

  FiscalYear.fromJson(dynamic json) {
    fiscalYearId = json['fiscal_year_id'];
    fiscalYear = json['fiscal_year'];
  }
  int? fiscalYearId;
  String? fiscalYear;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fiscal_year_id'] = fiscalYearId;
    map['fiscal_year'] = fiscalYear;
    return map;
  }
}
