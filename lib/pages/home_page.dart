import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:crypto_price_prediction/utilities/crypto_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          CryptoCard(
            cryptoCurrency: "BTC",
            subtitle: "Bitcoin",
            icon: Icons.currency_bitcoin,
            price: "1849",
            desc: btc_desc,
          ),
          CryptoCard(
            cryptoCurrency: "ETH",
            subtitle: "Ether",
            icon: Icons.currency_exchange,
            price: "3296",
            desc: eth_desc,
          ),
          CryptoCard(
            cryptoCurrency: "Polygon",
            subtitle: "Polygon",
            icon: Icons.currency_franc,
            price: "8935",
            desc: polygon_desc,
          ),
          CryptoCard(
            cryptoCurrency: "BNB",
            subtitle: "Binance Coin",
            icon: Icons.currency_ruble_outlined,
            price: "541",
            desc: bnb_desc,
          ),
        ],
      ),
    );
  }
}
