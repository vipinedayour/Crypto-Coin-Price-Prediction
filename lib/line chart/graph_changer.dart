import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';

class GraphChanger extends StatelessWidget {
  GraphChanger({super.key});
  final controller = Get.find<Controller>();
  // final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {
            controller.minX.value = 0;
            controller.interval.value = 90;
          },
          style: ButtonStyle(
            backgroundColor: controller.minX.value == 0
                ? MaterialStateProperty.all(Colors.grey[800])
                : MaterialStateProperty.all(Colors.grey[900]),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          child: const Text(
            "1y",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
            controller.minX.value = controller.maxX.value - 90;
            controller.interval.value = 30;
            print("here");
            print(controller.interval.value);
          },
          style: ButtonStyle(
            backgroundColor: controller.minX.value == controller.maxX.value - 90
                ? MaterialStateProperty.all(Colors.grey[800])
                : MaterialStateProperty.all(Colors.grey[900]),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
            controller.minX.value = controller.maxX.value - 30;
            controller.interval.value = 10;
          },
          style: ButtonStyle(
            backgroundColor: controller.minX.value == controller.maxX.value - 30
                ? MaterialStateProperty.all(Colors.grey[800])
                : MaterialStateProperty.all(Colors.grey[900]),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
            controller.minX.value = controller.maxX.value - 7;
            controller.interval.value = 1;
          },
          style: ButtonStyle(
            backgroundColor: controller.minX.value == controller.maxX.value - 7
                ? MaterialStateProperty.all(Colors.grey[800])
                : MaterialStateProperty.all(Colors.grey[900]),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
    );
  }
}
