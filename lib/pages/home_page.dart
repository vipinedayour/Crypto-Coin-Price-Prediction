import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:crypto_price_prediction/utilities/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/details_controller.dart';
import '../functions/status.dart';
import '../utilities/bottom_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final detailsController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    detailsController.fetchDetails();

    return Scaffold(
      backgroundColor: kBgColor,
      body: Obx(
        (() {
          if (detailsController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<CryptoCard> list = <CryptoCard>[
              CryptoCard(
                cryptoDetail: detailsController.bitcoin.value,
                icon: CryptoFontIcons.BTC,
              ),
              CryptoCard(
                cryptoDetail: detailsController.etherium.value,
                icon: CryptoFontIcons.ETH,
              ),
              CryptoCard(
                cryptoDetail: detailsController.dogecoin.value,
                icon: CryptoFontIcons.DOGE,
              ),
              CryptoCard(
                cryptoDetail: detailsController.usdt.value,
                icon: CryptoFontIcons.USDT,
              ),
              // CryptoCard(
              //   cryptoDetail: detailsController.bitcoin.value,
              //   icon: CryptoFontIcons.BTC,
              // ),
            ];
            return ListView(scrollDirection: Axis.vertical, children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 300,
                  height: 200,
                  child: Image.asset('images/select coin.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    'Coins',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              

              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: kCardGreen),
                  // gradient: LinearGradient(
                  //   begin: Alignment.centerLeft,
                  //   end: Alignment.centerRight,
                  //   colors: [
                  //     kCardBgColor,
                  //     kCardGreen,
                  //   ],
                  // ),
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButton(
                    underline: SizedBox(),
                    isExpanded: true,
                    itemHeight: 120,
                    // value: Text("Value"),
                    // disabledHint: Text("Nope"),
                    hint: Text(
                      "Select coin",
                      style: GoogleFonts.montserrat(
                          fontSize: 16, color: Colors.white),
                    ),
                    // icon: Icon(Icons.abc),
                    items: list
                        .map<DropdownMenuItem<CryptoCard>>((CryptoCard value) {
                      return DropdownMenuItem<CryptoCard>(
                          value: value, child: value);
                    }).toList(),
                    onChanged: (value) {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        builder: ((context) => BottomCard(
                              cryptoDetail: value!.cryptoDetail,
                              icon: value.icon,
                              status: marketStatus(value
                                  .cryptoDetail.changePercent24Hr
                                  .toString()),
                            )),
                      );
                    }),
              ),
            ]);
          }
        }),
      ),
    );
  }
}
