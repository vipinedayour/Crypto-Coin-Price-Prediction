import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:crypto_price_prediction/utilities/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    'Coins',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CryptoCard(
                  cryptoDetail: detailsController.bitcoin.value,
                  icon: CryptoFontIcons.BTC,
                ),
                const SizedBox(
                  height: 20,
                ),
                CryptoCard(
                  cryptoDetail: detailsController.etherium.value,
                  icon: CryptoFontIcons.ETH,
                ),
                const SizedBox(
                  height: 20,
                ),
                CryptoCard(
                  cryptoDetail: detailsController.dogecoin.value,
                  icon: CryptoFontIcons.DOGE,
                ),
                const SizedBox(
                  height: 20,
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
