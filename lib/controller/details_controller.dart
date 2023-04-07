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
      List coins = ['bitcoin', 'ethereum', 'tether', 'dogecoin'];

      for (var coin in coins) {
        var uri = Uri.https('api.coincap.io', '/v2/assets/$coin');
        final response = await http.get(uri);
        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);

          switch (coin) {
            case ('bitcoin'):
              bitcoin.value = dataFromJson(json['data']);
              break;
            case ('ethereum'):
              etherium.value = dataFromJson(json['data']);
              break;
            case ('tether'):
              usdt.value = dataFromJson(json['data']);
              break;
            case ('dogecoin'):
              dogecoin.value = dataFromJson(json['data']);
              break;
          }
        } else {
          print("error fetching data");
        }
      }
     
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
