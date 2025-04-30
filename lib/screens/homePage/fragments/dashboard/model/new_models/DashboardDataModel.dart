import 'MonthlyEarningGraph.dart';
import 'PortfolioPerformance.dart';
import 'Tasks.dart';
import 'SectorWiseInvestment.dart';
import 'AddModule.dart';
import 'CashDividend.dart';

class DashboardDataModel {
  DashboardDataModel({
    this.status,
    this.monthlyEarningGraph,
    this.portfolioPerformance,
    this.tasks,
    this.sectorWiseInvestment,
    this.addModule,
    this.cashDividend,
  });

  DashboardDataModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['monthly_earning_graph'] != null) {
      monthlyEarningGraph = [];
      json['monthly_earning_graph'].forEach((v) {
        monthlyEarningGraph?.add(MonthlyEarningGraph.fromJson(v));
      });
    }
    if (json['portfolio_performance'] != null) {
      portfolioPerformance = [];
      json['portfolio_performance'].forEach((v) {
        portfolioPerformance?.add(PortfolioPerformance.fromJson(v));
      });
    }
    if (json['tasks'] != null) {
      tasks = [];
      json['tasks'].forEach((v) {
        tasks?.add(Tasks.fromJson(v));
      });
    }
    if (json['sector_wise_investment'] != null) {
      sectorWiseInvestment = [];
      json['sector_wise_investment'].forEach((v) {
        sectorWiseInvestment?.add(SectorWiseInvestment.fromJson(v));
      });
    }
    addModule =
        json['add_module'] != null
            ? AddModule.fromJson(json['add_module'])
            : null;
    if (json['cash_dividend'] != null) {
      cashDividend = [];
      json['cash_dividend'].forEach((v) {
        cashDividend?.add(CashDividend.fromJson(v));
      });
    }
  }
  String? status;
  List<MonthlyEarningGraph>? monthlyEarningGraph;
  List<PortfolioPerformance>? portfolioPerformance;
  List<Tasks>? tasks;
  List<SectorWiseInvestment>? sectorWiseInvestment;
  AddModule? addModule;
  List<CashDividend>? cashDividend;
}
