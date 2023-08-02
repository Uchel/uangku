// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/transaction_controller.dart';

class C1TrxSwitch extends StatelessWidget {
  const C1TrxSwitch({
    super.key,
    required this.controller,
  });
  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.width * 0.2,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Obx(
        () => Row(
          children: [
            Switch(
              value: controller.isExpense.value,
              onChanged: (value) {
                controller.isExpense.toggle().value = value;
              },
              inactiveTrackColor: Colors.green[200],
              inactiveThumbColor: Colors.green,
              activeColor: Colors.red,
            ),
            Text(controller.isExpense.value ? "Expense" : "Income"),
          ],
        ),
      ),
    );
  }
}
