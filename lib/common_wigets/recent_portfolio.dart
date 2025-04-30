import 'package:flutter_github_cicd/screens/homePage/fragments/dashboard/model/new_models/PortfolioPerformance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentTransactionsCard extends StatelessWidget {
  final List<PortfolioPerformance> performanceList;
  RecentTransactionsCard({required this.performanceList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      width: Get.size.width,
      // margin: const EdgeInsets.only(top: 10, bottom: 20),
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PORTFOLIO PERFORMANCE",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).hintColor,
            ),
          ),
          SizedBox(height: 16),
          Column(
            children:
                performanceList
                    .map(
                      (performanceList) =>
                          TransactionRow(portfolioPerformance: performanceList),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}

class TransactionRow extends StatelessWidget {
  final PortfolioPerformance portfolioPerformance;

  const TransactionRow({required this.portfolioPerformance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // CircleAvatar(
          //   backgroundImage: AssetImage(transaction.imageUrl),
          //   radius: 20,
          // ),
          // SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  portfolioPerformance.instrumentName ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    portfolioPerformance.marketPrice ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          double.parse(portfolioPerformance.marketPrice ?? '') >
                                  double.parse(
                                    portfolioPerformance.avgRate ?? '',
                                  )
                              ? Theme.of(context).primaryColorDark
                              : Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    double.parse(portfolioPerformance.marketPrice ?? '') >
                            double.parse(portfolioPerformance.avgRate ?? '')
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    color:
                        double.parse(portfolioPerformance.marketPrice ?? '') >
                                double.parse(portfolioPerformance.avgRate ?? '')
                            ? Theme.of(context).primaryColorDark
                            : Theme.of(context).primaryColorLight,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Transaction {
  final String name;
  final String subtitle;
  final String amount;
  final String date;
  final bool isPositive;
  final String imageUrl;

  Transaction({
    required this.name,
    required this.subtitle,
    required this.amount,
    required this.date,
    required this.isPositive,
    required this.imageUrl,
  });
}
