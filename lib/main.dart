import 'dart:io';
import 'package:crypto_price_prediction/model/details.dart';
import 'package:crypto_price_prediction/pages/home_page.dart';
import 'package:crypto_price_prediction/pages/graph_page.dart';
import 'package:crypto_price_prediction/pages/splashscreen.dart';
import 'package:crypto_price_prediction/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  Paint.enableDithering = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(canvasColor: Colors.transparent),
        getPages: [
          GetPage(
            name: "/home",
            page: () => HomePage(),
          ),
          GetPage(
            name: "/chart",
            page: () => Chart(
              cryptoDetails: Data(),
            ),
          ),
          GetPage(
            name: "/splash",
            page: (() => SplashScreen()),
          ),
          GetPage(
            name: "/welcome",
            page: (() => WelcomePage()),
          )
        ],
        initialRoute: "/splash");
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
