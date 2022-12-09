import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import '../model/price_point.dart';

class Controller extends GetxController {
  var actualPriceList = [].obs;
  var predictedPriceList = [].obs;
  var isLoading = true.obs;
  var minX = 20.obs;
  var maxX = 110.obs;

  fetchPrice(String coin) async {
    isLoading.value = true;
    try {
      var uri = Uri.https('gktc123.pythonanywhere.com', coin);
      final response = await http.get(uri);
      print("Status Code:${response.statusCode}");

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var json = jsonDecode(jsonString);
        var a = List<double>.from(json['actual_price']);
        var p = List<double>.from(json['predicted_price']);
        // print(p);
        actualPriceList.value = a
            .mapIndexed(((index, element) =>
                PricePoint(x: index.toDouble(), y: element)))
            .toList();
        predictedPriceList.value = p
            .mapIndexed(((index, element) =>
                PricePoint(x: index.toDouble(), y: element)))
            .toList();
        // print(p.length);
        // print("actual price");
        // print(a);
        // print("prdicted price");
        // print(p);
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
