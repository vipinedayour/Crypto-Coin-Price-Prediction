import 'package:crypto_price_prediction/pages/graph_page.dart';
import 'package:crypto_price_prediction/utilities/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import 'constants.dart';

class BottomCard extends StatelessWidget {
  final controller = Get.put(Controller());

  final String cryptoCurrency;
  final String subtitle;
  final String price;
  final IconData icon;
  final String desc;
  final bool status;
  BottomCard(
      {super.key,
      required this.cryptoCurrency,
      required this.subtitle,
      required this.icon,
      required this.price,
      required this.desc,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.grey[900],
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
              title: cryptoCurrency,
              subtitle: subtitle,
              titleSize: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              desc,
              style: const TextStyle(
                  fontSize: 13, color: Color.fromARGB(255, 120, 120, 120)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomListTile(
                    title: "RANK",
                    subtitle: '256',
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
                Expanded(
                  child: CustomListTile(
                    title: "LIVE PRICE",
                    subtitle: '256',
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
                Expanded(
                  child: CustomListTile(
                    title: "MARKET CAP",
                    subtitle: '256',
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  controller.fetchPrice('bitcoin');
                  print("pressed");
                  Get.to(() => Chart());
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  "PRICE HISTORY",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
