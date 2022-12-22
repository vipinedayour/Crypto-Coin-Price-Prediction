import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:crypto_price_prediction/utilities/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/details_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final detailsController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    detailsController.fetchDetails();
    return Scaffold(
      backgroundColor: kBgColor,
      body: Obx(
        (() {
          if (detailsController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CryptoCard(
                  cryptoDetail: detailsController.bitcoin.value,
                  icon: CryptoFontIcons.BTC,
                ),
                CryptoCard(
                  cryptoDetail: detailsController.etherium.value,
                  icon: CryptoFontIcons.ETH,
                ),
                CryptoCard(
                  cryptoDetail: detailsController.dogecoin.value,
                  icon: CryptoFontIcons.DOGE,
                ),
                CryptoCard(
                  cryptoDetail: detailsController.usdt.value,
                  icon: CryptoFontIcons.USDT,
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
