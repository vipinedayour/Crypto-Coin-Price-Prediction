import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class LineTitles {
  static getTitleData() {
    final controller = Get.find<Controller>();

    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        // axisNameWidget: Text(
        //   "Days",
        //   style: TextStyle(fontSize: 20),
        // ),
        // axisNameSize: 25,
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: controller.interval.value.toDouble(),
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        drawBehindEverything: true,
        // axisNameWidget: Text(
        //   "Price",
        //   style: TextStyle(fontSize: 20),
        // ),
        // axisNameSize: 25,
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: leftTitleWidgets,
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  final controller = Get.put(Controller());
  Widget text;
  const style = TextStyle(
    color: Color(0xff68737d),
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  // switch (value.toInt()) {
  //   case 1:
  //     text = const Text('1d', style: style);
  //     break;
  //   case 30:
  //     text = const Text('30d', style: style);
  //     break;
  //   case 60:
  //     text = const Text('60d', style: style);
  //     break;
  //   case 90:
  //     text = const Text('90d', style: style);
  //     break;
  //   case 120:
  //     text = const Text('120d', style: style);
  //     break;
  //   case 150:
  //     text = const Text('150d', style: style);
  //     break;
  //   case 180:
  //     text = const Text('180d', style: style);
  //     break;
  //   case 210:
  //     text = const Text('210d', style: style);
  //     break;
  //   case 240:
  //     text = const Text('240d', style: style);
  //     break;
  //   case 270:
  //     text = const Text('270d', style: style);
  //     break;
  //   case 300:
  //     text = const Text('300d', style: style);
  //     break;
  //   case 330:
  //     text = const Text('330d', style: style);
  //     break;
  //   case 360:
  //     text = const Text('360d', style: style);
  //     break;
  //   default:
  //     text = const Text('', style: style);
  //     break;
  // }

  // List date = controller.dateList.value;
  text = Text(value.toInt().toString(), style: style);

  // for (int i = 0; i < date.length; i++) {
  //   text = Text(date[i], style: style);
  //   print(text);
  // }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff67727d),
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toInt()) {
    case 10000:
      text = '10K';
      break;
    case 15000:
      text = '15K';
      break;
    case 20000:
      text = '20K';
      break;
    case 25000:
      text = '25K';
      break;
    case 30000:
      text = '30k';
      break;
    case 35000:
      text = '35k';
      break;
    case 40000:
      text = '40k';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}
