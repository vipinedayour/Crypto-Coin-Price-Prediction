import 'package:crypto_price_prediction/controller/details_controller.dart';
import 'package:crypto_price_prediction/functions/stat.dart';
import 'package:crypto_price_prediction/model/details.dart';
import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/controller.dart';
import '../utilities/custom_legend.dart';
import '../utilities/line_graph.dart';

class Chart extends StatelessWidget {
  final controller = Get.put(Controller());
  Data cryptoDetails;
  Chart({required this.cryptoDetails});

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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(children: [
                      LineGraph(),
                      CustomLegend(),
                    ]),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          controller.minX.value = 20;
                          controller.maxX.value = 110;
                        },
                        style: ButtonStyle(
                          backgroundColor: controller.minX.value == 20
                              ? MaterialStateProperty.all(Colors.grey[800])
                              : MaterialStateProperty.all(Colors.grey[900]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          "3m",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.minX.value = 80;
                          controller.maxX.value = 110;
                        },
                        style: ButtonStyle(
                          backgroundColor: controller.minX.value == 80
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
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.minX.value = 103;
                          controller.maxX.value = 110;
                        },
                        style: ButtonStyle(
                          backgroundColor: controller.minX.value == 103
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
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Text(
                      "Analysis",
                      style: GoogleFonts.lato(
                          fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.blueGrey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Max.price",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                controller.maxPrice.value.toStringAsFixed(3) +
                                    "  \$",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.blueGrey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Min.price",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                controller.minPrice.value.toStringAsFixed(3) +
                                    "  \$",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
