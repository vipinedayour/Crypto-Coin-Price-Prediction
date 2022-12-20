import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final CrossAxisAlignment crossAxisAlignment;
  final double titleSize;
  final double subtitleSize;
  final FontWeight tileFontWeight;
  final FontWeight subtitleFontWeight;
  final Color titleColor;
  final Color subtitleColor;

  CustomListTile(
      {required this.title,
      required this.subtitle,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.titleSize = 18,
      this.subtitleSize = 14,
      this.tileFontWeight = FontWeight.normal,
      this.subtitleFontWeight = FontWeight.normal,
      this.subtitleColor = KTextGrey,
      this.titleColor = KTextWhite});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
              color: titleColor,
              fontSize: titleSize,
              fontWeight: tileFontWeight),
        ),
        Text(
          subtitle,
          style: TextStyle(
              color: subtitleColor,
              fontSize: subtitleSize,
              fontWeight: subtitleFontWeight),
        ),
      ],
    );
  }
}
