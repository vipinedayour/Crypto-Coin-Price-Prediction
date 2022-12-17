import 'package:crypto_price_prediction/utilities/bottom_card.dart';
import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:crypto_price_prediction/utilities/custom_list_tile.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final String cryptoCurrency;
  final String subtitle;
  final String price;
  final IconData icon;
  final String desc;
  final bool status;
  final String imagePath;
  const CryptoCard(
      {super.key,
      required this.cryptoCurrency,
      required this.subtitle,
      required this.icon,
      required this.price,
      required this.desc,
      required this.status,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          builder: ((context) => Container(
                color: Colors
                    .transparent, //could change this to Color(0xFF737373),
                //so you don't have to change MaterialApp canvasColor
                child: BottomCard(
                  cryptoCurrency: cryptoCurrency,
                  price: price,
                  subtitle: subtitle,
                  icon: icon,
                  desc: desc,
                  status: status,
                ),
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
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    // Icon(
                    //   icon,
                    //   color: Colors.white,
                    // ),
                    Image(
                      image: AssetImage(imagePath),
                      height: 40,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomListTile(
                      title: cryptoCurrency,
                      subtitle: subtitle,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )
                  ],
                ),
              ),
              Text(
                price,
                style: TextStyle(
                    color: status ? kTextGreen : kTextRed, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
