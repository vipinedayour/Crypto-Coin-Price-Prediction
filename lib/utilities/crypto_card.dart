import 'package:crypto_price_prediction/utilities/bottom_card.dart';
import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:crypto_price_prediction/utilities/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../functions/round.dart';
import '../functions/status.dart';
import '../model/details.dart';

class CryptoCard extends StatelessWidget {
  final IconData icon;
  final Data cryptoDetail;
  const CryptoCard({
    super.key,
    required this.cryptoDetail,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    bool status = marketStatus(cryptoDetail.changePercent24Hr.toString());
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          builder: ((context) => BottomCard(
                cryptoDetail: cryptoDetail,
                icon: icon,
                status: status,
              )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              kCardBgColor,
              status ? kCardGreen : kCardRed,
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: 380,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomListTile(
                      title: cryptoDetail.symbol.toString(),
                      subtitle: cryptoDetail.name.toString(),
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$ ${roundIt(cryptoDetail.priceUsd.toString())}",
                    style: GoogleFonts.montserrat(
                        fontSize: 16, color: Colors.white),
                  ),
                  Row(
                    children: [
                      status ? UpArrow() : DownArrow(),
                      Text(
                        roundIt(cryptoDetail.changePercent24Hr.toString()),
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: status ? kTextGreen : kTextRed,
                        ),
                        // style: TextStyle(
                        //     color: status ? kTextGreen : kTextRed,
                        //     fontSize: 15),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
