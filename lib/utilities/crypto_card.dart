import 'package:crypto_price_prediction/utilities/bottom_card.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final String cryptoCurrency;
  final String subtitle;
  final String price;
  final IconData icon;
  final String desc;
  const CryptoCard(
      {super.key,
      required this.cryptoCurrency,
      required this.subtitle,
      required this.icon,
      required this.price,
      required this.desc});

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
                ),
              )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: 380,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text(cryptoCurrency,
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  subtitle: Text(
                    subtitle,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Text(
                price,
                style: TextStyle(color: Colors.black, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
