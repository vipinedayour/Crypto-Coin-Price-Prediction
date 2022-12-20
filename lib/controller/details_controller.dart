import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/details.dart';

class DetailsController extends GetxController {
  var bitcoin = Data().obs;
  var etherium = Data().obs;
  var dogecoin = Data().obs;
  var usdt = Data().obs;
  var isLoading = true.obs;

  fetchDetails() async {
    isLoading.value = true;
    try {
      var uri = Uri.https('api.coincap.io', '/v2/assets');
      final response = await http.get(uri);

      print("Status Code:${response.statusCode}");

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);

        bitcoin.value = dataFromJson(json['data'][0]);
        etherium.value = dataFromJson(json['data'][1]);
        usdt.value = dataFromJson(json['data'][2]);
        dogecoin.value = dataFromJson(json['data'][7]);
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
