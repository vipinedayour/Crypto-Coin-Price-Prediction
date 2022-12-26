import 'dart:convert';
import 'package:crypto_price_prediction/functions/stat.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import '../model/price_point.dart';

class Controller extends GetxController {
  var actualPriceList = [].obs;
  var predictedPriceList = [].obs;
  var dateList = [].obs;
  var isLoading = true.obs;
  var minX = 0.obs;
  var maxX = 0.obs;
  var maxPrice = 0.0.obs;
  var minPrice = 0.0.obs;
  var interval = 90.obs;

  fetchPrice(String coin) async {
    isLoading.value = true;
    try {
      var uri = Uri.https('gktc123.pythonanywhere.com', coin);
      final response = await http.get(uri);
      print("Status Code:${response.statusCode}");

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var json = jsonDecode(jsonString);
        var actualPrice = List<double>.from(json['actual_price']);
        var predictedPrice = List<double>.from(json['predicted_price']);
        dateList.value = json['date'];
        maxPrice.value = findMax(actualPrice);
        minPrice.value = findMin(actualPrice);
        maxX.value = actualPrice.length - 1;
        actualPriceList.value = actualPrice
            .mapIndexed(((index, element) =>
                PricePoint(x: index.toDouble(), y: element)))
            .toList();
        predictedPriceList.value = predictedPrice
            .mapIndexed(((index, element) =>
                PricePoint(x: index.toDouble(), y: element)))
            .toList();
      } else {
        print("error fetching data");
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
