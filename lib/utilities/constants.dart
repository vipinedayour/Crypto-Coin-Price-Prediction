import 'package:flutter/material.dart';

const String btc_desc =
    "On 3 January 2009, the bitcoin network was created when Nakamoto mined the starting block of the chain, known as the genesis block.";
const String eth_desc =
    "Ethereum was conceived in 2013 by programmer Vitalik Buterin";
const String polygon_desc =
    " Polygon aka \"Ethereum's Internet of Blockchains\" launched under the name Matic Network in 2017 by four software engineers";
const String bnb_desc =
    "Binance Coin was created in July 2017 and initially worked on the ethereum blockchain with the token ERC-20";
const Color kBgColor = Colors.black;
const Color kCardBgColor = Color.fromARGB(255, 15, 15, 15);
const Color kCardGreen = Color.fromARGB(255, 23, 54, 45);
const Color kCardRed = Color.fromARGB(255, 54, 23, 23);
const Color KTextGrey = Color.fromARGB(255, 120, 120, 120);
const Color KTextWhite = Colors.white;
const Color kTextGreen = Color.fromARGB(255, 13, 188, 120);
const Color kTextRed = Color.fromARGB(255, 227, 64, 86);
const Color kActualPriceColor = Color.fromARGB(255, 14, 250, 211);
const Color kPredictedPriceColor = Color.fromARGB(255, 250, 144, 14);
const kSplashscreenGradient = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Colors.yellow,
      Colors.red,
    ],
  ),
);

const kSplashscreenLogoTextStyle =
    TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w300);

class DownArrow extends StatelessWidget {
  const DownArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.arrow_drop_down,
      color: kTextRed,
    );
  }
}

class UpArrow extends StatelessWidget {
  const UpArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.arrow_drop_up,
      color: kTextGreen,
    );
  }
}
