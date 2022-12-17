import 'package:flutter/material.dart';

class CustomLegend extends StatelessWidget {
  const CustomLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 40,
      top: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.stacked_line_chart,
                color: Color.fromARGB(255, 250, 144, 14),
                size: 30,
              ),
              Text(
                "Predicted Price",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Row(
            children: const [
              Icon(
                Icons.stacked_line_chart,
                color: Color.fromARGB(255, 14, 250, 211),
                size: 30,
              ),
              Text(
                "Actual Price",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ],
      ),
    );
  }
}
