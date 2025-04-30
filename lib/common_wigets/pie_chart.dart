import 'dart:math';
import 'package:flutter_github_cicd/screens/homePage/fragments/dashboard/model/new_models/SectorWiseInvestment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomPieChartWithLegend extends StatelessWidget {
  final List<SectorWiseInvestment> sectorWiseInvestment;
  final random = Random();
  CustomPieChartWithLegend({super.key, required this.sectorWiseInvestment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      width: Get.size.width,
      // margin: const EdgeInsets.only(top: 10, bottom: 20),
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Sector Wise Investment".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          // SizedBox(height: 10),
          // Wrap(
          //   alignment: WrapAlignment.center,
          //   spacing: 8,
          //   runSpacing: 4,
          //   children: sectorWiseInvestment.map((chartData) {
          //     return Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Container(
          //           width: 24,
          //           height: 12,
          //           decoration: BoxDecoration(
          //             shape: BoxShape.rectangle, // Change to BoxShape.circle or other shapes
          //             color: getRandomColor(random),
          //           ),
          //         ),
          //         SizedBox(width: 4),
          //         Text(chartData.sectorName??''),
          //       ],
          //     );
          //   }).toList(),
          // ),
          SfCircularChart(
            legend: Legend(
              isVisible: true,
              overflowMode: LegendItemOverflowMode.wrap,
              alignment: ChartAlignment.near,
              position: LegendPosition.top,
              height: '90',
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CircularSeries>[
              DoughnutSeries<SectorWiseInvestment, String>(
                dataSource: sectorWiseInvestment,
                xValueMapper:
                    (SectorWiseInvestment data, _) => data.sectorName ?? '',
                yValueMapper:
                    (SectorWiseInvestment data, _) =>
                        double.parse(data.marketValueSecurities ?? ''),
                pointColorMapper:
                    (SectorWiseInvestment data, _) => getRandomColor(random),
                explode: true,
                explodeAll: true,
                radius: '90',
                explodeOffset: '2',
                enableTooltip: true,
                // dataLabelSettings: DataLabelSettings(isVisible: true)
                // dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Color getRandomColor(Random random) {
  return Color.fromARGB(
    255, // Full opacity
    random.nextInt(256), // Red (0-255)
    random.nextInt(256), // Green (0-255)
    random.nextInt(256), // Blue (0-255)
  );
}
