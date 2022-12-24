import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLegend extends StatelessWidget {
  const CustomLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      top: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.call_missed_outgoing_sharp,
                color: kPredictedPriceColor,
                size: 20,
              ),
              Text(
                "Predicted Price",
                style:
                    GoogleFonts.montserrat(fontSize: 15, color: Colors.white),
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.call_missed_outgoing_sharp,
                color: kActualPriceColor,
                size: 20,
              ),
              Text(
                "Actual Price",
                style:
                    GoogleFonts.montserrat(fontSize: 15, color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
