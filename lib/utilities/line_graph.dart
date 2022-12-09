import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import '../model/line_titles.dart';

class LineGraph extends StatelessWidget {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: controller.minX.toDouble(),
        maxX: controller.maxX.toDouble(),
        titlesData: LineTitles.getTitleData(),
        lineBarsData: [
          LineChartBarData(
            spots: controller.actualPriceList
                .map((element) => FlSpot(element.x, element.y))
                .toList(),
            isCurved: true,
            color: Color.fromARGB(255, 14, 250, 211),
            barWidth: 3,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: Color.fromARGB(0, 14, 250, 211),
            ),
          ),
          LineChartBarData(
            spots: controller.predictedPriceList
                .map((element) => FlSpot(element.x, element.y))
                .toList(),
            isCurved: true,
            color: Color.fromARGB(255, 250, 144, 14),
            barWidth: 3,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: Color.fromARGB(0, 250, 144, 14),
            ),
          ),
        ],
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) => FlLine(
            color: const Color(0xff37343d),
            strokeWidth: 1,
          ),
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) => FlLine(
            color: const Color(0xff37343d),
            strokeWidth: 1,
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: const Color(0xff37343d),
          ),
        ),
      ),
    );
  }
}
