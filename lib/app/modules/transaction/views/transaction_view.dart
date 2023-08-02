import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uangku_getx/app/modules/transaction/views/widgets/c1_trx_switch.dart';
import 'package:uangku_getx/app/modules/transaction/views/widgets/c2_trx_form_button.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add transaction',
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              C1TrxSwitch(controller: controller),
              C2TrxFormButton(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
