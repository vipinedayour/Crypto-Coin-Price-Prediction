import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:crypto_price_prediction/pages/welcome.dart';
import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      curve: Curves.easeInOut,
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: double.maxFinite,
      splash: Container(
        decoration: kSplashscreenGradient,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'images/logo.png',
              ),
            ),
            Center(
              child: Text(
                "Crypto Monk".toUpperCase(),
                style: GoogleFonts.monoton(
                    textStyle: kSplashscreenLogoTextStyle, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      nextScreen: const WelcomePage(),
      pageTransitionType: PageTransitionType.rightToLeft,
    );
  }
}
