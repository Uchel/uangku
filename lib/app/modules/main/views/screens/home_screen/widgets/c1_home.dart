import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'c1_home_income.dart';
import 'c1_home_outcome.dart';

class C1Home extends StatelessWidget {
  const C1Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(Get.width * 0.05),
      height: Get.height * 0.12,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          C1Income(),
          C1Outcome(),
        ],
      ),
    );
  }
}
