import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final CrossAxisAlignment crossAxisAlignment;
  final double titleSize;
  final double subtitleSize;
  CustomListTile(
      {required this.title,
      required this.subtitle,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.titleSize = 18,
      this.subtitleSize = 14});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: titleSize),
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: const Color.fromARGB(255, 120, 120, 120),
            fontSize: subtitleSize,
          ),
        ),
      ],
    );
  }
}
