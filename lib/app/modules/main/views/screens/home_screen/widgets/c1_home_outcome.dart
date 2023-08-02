import 'package:flutter/material.dart';
import 'package:get/get.dart';

class C1Outcome extends StatelessWidget {
  const C1Outcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.42,
      height: Get.width * 0.25,
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            height: Get.width * 0.10,
            width: Get.width * 0.10,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Icon(
              Icons.upload,
              color: Colors.red,
            ),
          ),
          SizedBox(width: 5),
          Container(
            width: Get.width * 0.3,
            height: Get.width * 0.24,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Outcome",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Rp.3.800.000",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
