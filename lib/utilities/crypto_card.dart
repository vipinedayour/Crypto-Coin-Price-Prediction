import 'package:crypto_price_prediction/utilities/bottom_card.dart';
import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:crypto_price_prediction/utilities/custom_list_tile.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final String symbol;
  final String name;
  final String price;
  final IconData icon;
  final bool status;
  final String rank;
  final String marketCapUsd;
  final String id;
  const CryptoCard(
      {super.key,
      required this.symbol,
      required this.name,
      required this.icon,
      required this.price,
      required this.status,
      required this.rank,
      required this.id,
      required this.marketCapUsd});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          builder: ((context) => BottomCard(
                symbol: symbol,
                price: price,
                name: name,
                icon: icon,
                status: status,
                rank: rank,
                marketCapUsd: marketCapUsd,
                id: id,
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
                      title: symbol,
                      subtitle: name,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  status ? UpArrow() : DownArrow(),
                  Text(
                    price,
                    style: TextStyle(
                        color: status ? kTextGreen : kTextRed, fontSize: 18),
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
