import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:crypto_price_prediction/functions/status.dart';
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
      body: Obx((() {
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
                symbol: detailsController.bitcoin.value.symbol.toString(),
                name: detailsController.bitcoin.value.name.toString(),
                icon: CryptoFontIcons.BTC,
                price: double.parse(
                        detailsController.bitcoin.value.priceUsd.toString())
                    .toStringAsFixed(2),
                status: marketStatus(detailsController
                    .bitcoin.value.changePercent24Hr
                    .toString()),
                rank: detailsController.bitcoin.value.rank.toString(),
                marketCapUsd: double.parse(
                        detailsController.bitcoin.value.marketCapUsd.toString())
                    .toStringAsFixed(2),
                id: detailsController.bitcoin.value.id.toString(),
              ),
              CryptoCard(
                symbol: detailsController.etherium.value.symbol.toString(),
                name: detailsController.etherium.value.name.toString(),
                icon: CryptoFontIcons.ETH,
                price: double.parse(
                        detailsController.etherium.value.priceUsd.toString())
                    .toStringAsFixed(2),
                status: marketStatus(detailsController
                    .etherium.value.changePercent24Hr
                    .toString()),
                rank: detailsController.etherium.value.rank.toString(),
                marketCapUsd: double.parse(detailsController
                        .etherium.value.marketCapUsd
                        .toString())
                    .toStringAsFixed(2),
                id: detailsController.etherium.value.id.toString(),
              ),
              CryptoCard(
                symbol: detailsController.dogecoin.value.symbol.toString(),
                name: detailsController.dogecoin.value.name.toString(),
                icon: CryptoFontIcons.DOGE,
                price: double.parse(
                        detailsController.dogecoin.value.priceUsd.toString())
                    .toStringAsFixed(2),
                status: marketStatus(detailsController
                    .dogecoin.value.changePercent24Hr
                    .toString()),
                rank: detailsController.dogecoin.value.rank.toString(),
                marketCapUsd: double.parse(detailsController
                        .dogecoin.value.marketCapUsd
                        .toString())
                    .toStringAsFixed(2),
                id: detailsController.dogecoin.value.id.toString(),
              ),
              CryptoCard(
                symbol: detailsController.usdt.value.symbol.toString(),
                name: detailsController.usdt.value.name.toString(),
                icon: CryptoFontIcons.USDT,
                price: double.parse(
                        detailsController.usdt.value.priceUsd.toString())
                    .toStringAsFixed(2),
                status: marketStatus(
                    detailsController.usdt.value.changePercent24Hr.toString()),
                rank: detailsController.usdt.value.rank.toString(),
                marketCapUsd: double.parse(
                        detailsController.usdt.value.marketCapUsd.toString())
                    .toStringAsFixed(2),
                id: detailsController.usdt.value.id.toString(),
              ),
            ],
          );
        }
      })),
    );
  }
}
