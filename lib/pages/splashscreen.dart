import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:crypto_price_prediction/pages/home_page.dart';
import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const kSplashscreenLogoTextStyle = TextStyle(
        color: Colors.white, fontSize: 24, fontWeight: FontWeight.w300);
    return AnimatedSplashScreen(
        splashTransition: SplashTransition.fadeTransition,
        duration: 3000,
        splashIconSize: double.maxFinite,
        splash: Container(
          decoration: kSplashscreenGradient,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png',
                width: 300,
              ),
              Center(
                child: Text(
                  "Crypto Monk".toUpperCase(),
                  style: GoogleFonts.monoton(
                    textStyle: kSplashscreenLogoTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        nextScreen: HomePage());
  }
}
