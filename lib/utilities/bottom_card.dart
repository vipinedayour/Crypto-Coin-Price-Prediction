import 'package:crypto_price_prediction/functions/conversion.dart';
import 'package:crypto_price_prediction/pages/graph_page.dart';
import 'package:crypto_price_prediction/utilities/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import '../model/details.dart';
import 'constants.dart';

class BottomCard extends StatelessWidget {
  final controller = Get.put(Controller());

  final Data cryptoDetail;
  final String symbol;
  final String name;
  final String price;
  final IconData icon;
  final bool status;
  final String rank;
  final String marketCapUsd;
  final String id;
  BottomCard(
      {super.key,
      required this.cryptoDetail,
      required this.symbol,
      required this.name,
      required this.icon,
      required this.price,
      required this.status,
      required this.rank,
      required this.marketCapUsd,
      required this.id});

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
        // boxShadow: [
        // BoxShadow(
        //   color: Color.fromARGB(255, 243, 85, 138),
        //   spreadRadius: 0.5,
        //   blurRadius: 50,
        // ),

        // BoxShadow(
        //   color: Colors.pink,
        //   spreadRadius: -4,
        //   blurRadius: 5,0bn c0.

        // )
        // ]
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
              title: name,
              subtitle: symbol,
              titleSize: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            // const SizedBox(
            //   height: 25,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomListTile(
                    title: "RANK",
                    subtitle: rank,
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
                    subtitle: '\$ ' + convertIt(price),
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
                    subtitle: convertIt(marketCapUsd),
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
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                controller.fetchPrice(id);

                print("pressed");
                Get.to(() => Chart(cryptoDetails: cryptoDetail,));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Text(
                "PRICE HISTORY",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
