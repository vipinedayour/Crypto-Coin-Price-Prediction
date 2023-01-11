import 'package:crypto_price_prediction/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 400,
              height: 300,
              child: Image.asset('images/welcome_page_image.png'),
            ),
          ),
          Text(
            'Stay Organized \n Everywhere',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontSize: 32, fontWeight: FontWeight.w400),
          ),
          Container(
            width: 400,
            margin: EdgeInsets.only(left: 50, right: 50, bottom: 30, top: 30),
            child: Text(
              "Get the latest prices of the cryptocoin and predicted price in the future.",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w200,
                fontSize: 18,
              ),
              // TextStyle(fontWeight: FontWeight.w200, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              onPressed: (() {
                Get.to(HomePage());
              }),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
              ),
              child: Text(
                'Get Started',
                style: GoogleFonts.montserrat(),
              ))
        ],
      ),
    ));
  }
}
