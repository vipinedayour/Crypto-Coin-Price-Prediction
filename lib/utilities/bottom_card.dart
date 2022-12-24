import 'package:crypto_price_prediction/functions/conversion.dart';
import 'package:crypto_price_prediction/pages/graph_page.dart';
import 'package:crypto_price_prediction/utilities/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/controller.dart';
import '../model/details.dart';
import 'constants.dart';

class BottomCard extends StatelessWidget {
  final controller = Get.put(Controller());

  final Data cryptoDetail;
  final IconData icon;
  final bool status;
  BottomCard({
    super.key,
    required this.cryptoDetail,
    required this.icon,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [status ? kCardGreen : kCardRed, kCardBgColor],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 45,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomListTile(
              title: cryptoDetail.name.toString(),
              subtitle: cryptoDetail.symbol.toString(),
              titleSize: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomListTile(
                    title: "RANK",
                    subtitle: cryptoDetail.rank.toString(),
                    crossAxisAlignment: CrossAxisAlignment.center,
                    titleSize: 14,
                    subtitleSize: 20,
                    titleColor: KTextGrey,
                    subtitleColor: KTextWhite,
                    subtitleFontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: CustomListTile(
                    title: "LIVE PRICE",
                    subtitle:
                        '\$ ${convertIt(cryptoDetail.priceUsd.toString())}',
                    crossAxisAlignment: CrossAxisAlignment.center,
                    titleSize: 14,
                    subtitleSize: 20,
                    titleColor: KTextGrey,
                    subtitleColor: KTextWhite,
                    subtitleFontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: CustomListTile(
                    title: "MARKET CAP",
                    subtitle: convertIt(cryptoDetail.marketCapUsd.toString()),
                    crossAxisAlignment: CrossAxisAlignment.center,
                    titleSize: 14,
                    subtitleSize: 20,
                    titleColor: KTextGrey,
                    subtitleColor: KTextWhite,
                    subtitleFontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                controller.fetchPrice(cryptoDetail.id.toString());

                print("pressed");
                Get.to(() => Chart(
                      cryptoDetails: cryptoDetail,
                    ));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Text(
                "PRICE HISTORY",
                style:
                    GoogleFonts.montserrat(fontSize: 16, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
