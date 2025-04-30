import 'TopProducts.dart';
import 'LatestDeals.dart';

class DashboardData {
  DashboardData({
    this.setupProgress,
    this.balance,
    this.totalWithdrawal,
    this.rewards,
    this.topProducts,
    this.latestDeals,
  });

  DashboardData.fromJson(dynamic json) {
    setupProgress = json['setup_progress'];
    balance = json['balance'];
    totalWithdrawal = json['total_withdrawal'];
    rewards = json['rewards'];
    if (json['top_products'] != null) {
      topProducts = [];
      json['top_products'].forEach((v) {
        topProducts?.add(TopProducts.fromJson(v));
      });
    }
    if (json['latest_deals'] != null) {
      latestDeals = [];
      json['latest_deals'].forEach((v) {
        latestDeals?.add(LatestDeals.fromJson(v));
      });
    }
  }
  int? setupProgress;
  double? balance;
  double? totalWithdrawal;
  double? rewards;
  List<TopProducts>? topProducts;
  List<LatestDeals>? latestDeals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['setup_progress'] = setupProgress;
    map['balance'] = balance;
    map['total_withdrawal'] = totalWithdrawal;
    map['rewards'] = rewards;
    if (topProducts != null) {
      map['top_products'] = topProducts?.map((v) => v.toJson()).toList();
    }
    if (latestDeals != null) {
      map['latest_deals'] = latestDeals?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
