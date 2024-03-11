import 'package:demo/app_theme.dart';
import 'package:demo/model/individual_chart_data.dart';
import 'package:demo/provider/to_do_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapx/zapx.dart';

class MyBarGraphChart extends StatelessWidget {
  const MyBarGraphChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoProvider>(builder: (context, value, child) {
      return FutureBuilder(
          future: value.getChartData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<int> numbers = [0, 1, 2, 3, 4, 5, 6];
            double largestAmount = -9223372036854775808;
            for (IndividualChartData data in snapshot.data!) {
              if (largestAmount < data.y) {
                largestAmount = data.y;
              }
            }
            print(largestAmount);
            return BarChart(BarChartData(
                    maxY: largestAmount,
                    minY: 0,
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                        leftTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                            axisNameSize: 22,
                            axisNameWidget: Text('             Money Average',
                                style: AppTheme.displayMedium)),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                                reservedSize: 27,
                                showTitles: true,
                                getTitlesWidget: getTitleWidget),
                            axisNameSize: 27,
                            axisNameWidget: const Text('   Weekly Day Graph ',
                                style: AppTheme.displayMedium))),
                    barGroups: snapshot.data!
                        .map((data) =>
                            BarChartGroupData(x: data.x + 1, barRods: [
                              BarChartRodData(
                                  toY: data.y,
                                  gradient: const LinearGradient(colors: [
                                    Color(0xFF03A9F4),
                                    Color(0xFFB69EF8)
                                  ]),
                                  width: 12,
                                  backDrawRodData: BackgroundBarChartRodData(
                                      color: Colors.grey[300],
                                      show: true,
                                      toY: largestAmount),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(3),
                                      topRight: Radius.circular(3)))
                            ]))
                        .toList()))
                .paddingOnly(top: 25, left: 10);
          });
    });
  }

  Widget getTitleWidget(double value, TitleMeta meta) {
    final style = AppTheme.copyWith(
      color: Colors.grey,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
    Widget text;
    switch (value) {
      case 1:
        text = Text('S', style: style);
        break;
      case 2:
        text = Text('M', style: style);
        break;
      case 3:
        text = Text('T', style: style);
        break;
      case 4:
        text = Text('W', style: style);
        break;
      case 5:
        text = Text('T', style: style);
        break;
      case 6:
        text = Text('F', style: style);
        break;
      case 7:
        text = Text('S', style: style);
        break;
      default:
        text = const Text('');
    }
    return SideTitleWidget(child: text, axisSide: meta.axisSide);
  }
}
