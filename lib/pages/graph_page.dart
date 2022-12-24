import 'package:crypto_price_prediction/line%20chart/graph_changer.dart';

import 'package:crypto_price_prediction/model/details.dart';
import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:crypto_price_prediction/utilities/details_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/controller.dart';
import '../functions/conversion.dart';
import '../functions/round.dart';
import '../line chart/custom_legend.dart';
import '../line chart/line_graph.dart';

class Chart extends StatelessWidget {
  final controller = Get.put(Controller());
  Data cryptoDetails;
  Chart({super.key, required this.cryptoDetails});

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a)
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBgColor,
        body: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: LineGraph(),
                      ),
                      const CustomLegend(),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 80),
                          child: Text(
                            cryptoDetails.name.toString().toUpperCase(),
                            style: GoogleFonts.abel(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          controller.minX.value = 0;
                        },
                        style: ButtonStyle(
                          backgroundColor: controller.minX.value == 0
                              ? MaterialStateProperty.all(Colors.grey[800])
                              : MaterialStateProperty.all(Colors.grey[900]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        child: Text(
                          "1y",
                          style: GoogleFonts.montserrat(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.minX.value = controller.maxX.value - 90;
                        },
                        style: ButtonStyle(
                          backgroundColor: controller.minX.value ==
                                  controller.maxX.value - 90
                              ? MaterialStateProperty.all(Colors.grey[800])
                              : MaterialStateProperty.all(Colors.grey[900]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        child: Text(
                          "3m",
                          style: GoogleFonts.montserrat(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.minX.value = controller.maxX.value - 30;
                        },
                        style: ButtonStyle(
                          backgroundColor: controller.minX.value ==
                                  controller.maxX.value - 30
                              ? MaterialStateProperty.all(Colors.grey[800])
                              : MaterialStateProperty.all(Colors.grey[900]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        child: Text(
                          "1m",
                          style: GoogleFonts.montserrat(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.minX.value = controller.maxX.value - 7;
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              controller.minX.value == controller.maxX.value - 7
                                  ? MaterialStateProperty.all(Colors.grey[800])
                                  : MaterialStateProperty.all(Colors.grey[900]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        child: Text(
                          "1w",
                          style: GoogleFonts.montserrat(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  DetailsCard(
                    item: "Price",
                    value: roundIt(cryptoDetails.priceUsd.toString()),
                  ),
                  DetailsCard(
                    item: "Rank",
                    value: cryptoDetails.rank.toString(),
                  ),
                  DetailsCard(
                    item: "Change percent",
                    value: roundIt(cryptoDetails.changePercent24Hr.toString()),
                  ),
                  DetailsCard(
                    item: "Market Cap USD",
                    value: convertIt(cryptoDetails.marketCapUsd.toString()),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}




// Column(
//                 children: [
//                   Expanded(
//                     flex: 5,
//                     child: Stack(
//                       children: [
//                         CustomLegend(),
//                         LineGraph(),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                       flex: 1,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               controller.minX.value = 0;
//                             },
//                             style: ButtonStyle(
//                               backgroundColor: controller.minX.value == 0
//                                   ? MaterialStateProperty.all(Colors.grey[800])
//                                   : MaterialStateProperty.all(Colors.grey[900]),
//                               shape: MaterialStateProperty.all<
//                                   RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(18.0),
//                                 ),
//                               ),
//                             ),
//                             child: const Text(
//                               "1y",
//                               style:
//                                   TextStyle(fontSize: 15, color: Colors.white),
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               controller.minX.value =
//                                   controller.maxX.value - 90;
//                             },
//                             style: ButtonStyle(
//                               backgroundColor: controller.minX.value ==
//                                       controller.maxX.value - 90
//                                   ? MaterialStateProperty.all(Colors.grey[800])
//                                   : MaterialStateProperty.all(Colors.grey[900]),
//                               shape: MaterialStateProperty.all<
//                                   RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(18.0),
//                                 ),
//                               ),
//                             ),
//                             child: const Text(
//                               "3m",
//                               style:
//                                   TextStyle(fontSize: 15, color: Colors.white),
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               controller.minX.value =
//                                   controller.maxX.value - 30;
//                             },
//                             style: ButtonStyle(
//                               backgroundColor: controller.minX.value ==
//                                       controller.maxX.value - 30
//                                   ? MaterialStateProperty.all(Colors.grey[800])
//                                   : MaterialStateProperty.all(Colors.grey[900]),
//                               shape: MaterialStateProperty.all<
//                                   RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(18.0),
//                                 ),
//                               ),
//                             ),
//                             child: Text(
//                               "1m",
//                               style:
//                                   TextStyle(fontSize: 15, color: Colors.white),
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               controller.minX.value = controller.maxX.value - 7;
//                             },
//                             style: ButtonStyle(
//                               backgroundColor: controller.minX.value ==
//                                       controller.maxX.value - 7
//                                   ? MaterialStateProperty.all(Colors.grey[800])
//                                   : MaterialStateProperty.all(Colors.grey[900]),
//                               shape: MaterialStateProperty.all<
//                                   RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(18.0),
//                                 ),
//                               ),
//                             ),
//                             child: Text(
//                               "1w",
//                               style:
//                                   TextStyle(fontSize: 15, color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       )),
//                   Expanded(
//                       flex: 3,
//                       child: ListView(
//                         children: [
//                           Container(
//                             width: 50,
//                             height: 50,
//                             color: Colors.red,
//                             margin: EdgeInsets.all(5),
//                           ),
//                           Container(
//                             width: 50,
//                             height: 50,
//                             color: Colors.red,
//                             margin: EdgeInsets.all(5),
//                           ),
//                           Container(
//                             width: 50,
//                             height: 50,
//                             color: Colors.red,
//                             margin: EdgeInsets.all(5),
//                           ),
//                           Container(
//                             width: 50,
//                             height: 50,
//                             color: Colors.red,
//                             margin: EdgeInsets.all(5),
//                           ),
//                           Container(
//                             width: 50,
//                             height: 50,
//                             color: Colors.red,
//                             margin: EdgeInsets.all(5),
//                           ),
//                         ],
//                       ))
//                 ],
//               );