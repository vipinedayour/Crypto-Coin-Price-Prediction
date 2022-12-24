import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import 'line_titles.dart';

class LineGraph extends StatelessWidget {
  // final controller = Get.find<Controller>();
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: LineChart(
        LineChartData(
          clipData: FlClipData.horizontal(),

          minX: controller.minX.toDouble(),
          maxX: controller.maxX.toDouble(),

          titlesData: LineTitles.getTitleData(),
          lineBarsData: [
            LineChartBarData(
              spots: controller.actualPriceList
                  .map((element) => FlSpot(element.x, element.y))
                  .toList(),
              isCurved: true,
              color: kActualPriceColor,
              barWidth: 3,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: false,
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(62, 14, 250, 211),
                    Color.fromARGB(0, 14, 250, 211)
                  ],
                ),
                color: Color.fromARGB(29, 14, 250, 211),
              ),
            ),
            LineChartBarData(
              spots: controller.predictedPriceList
                  .map((element) => FlSpot(element.x, element.y))
                  .toList(),
              isCurved: true,
              color: kPredictedPriceColor,
              barWidth: 3,
              dotData: FlDotData(show: false),
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

          // borderData: FlBorderData(
          //   show: true,
          //   border: Border.all(
          //     color: const Color(0xff37343d),
          //   ),
          // ),
        ),
      ),
    );
  }
}
