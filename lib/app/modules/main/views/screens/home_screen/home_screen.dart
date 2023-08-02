import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uangku_getx/app/modules/main/views/screens/home_screen/widgets/c1_home.dart';
import 'package:uangku_getx/app/modules/main/views/screens/home_screen/widgets/c2_home.dart';
import 'package:uangku_getx/app/modules/main/views/screens/home_screen/widgets/c3_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: Get.width,
        height: Get.height,
        margin: EdgeInsets.all(Get.width * 0.03),
        child: Column(
          children: [
            /* Saldo Income and OutCome c1 */
            C1Home(),
            /* Text Transaction c2 */
            C2Home(),
            /* Card History List c3 */
            C3Home(),
          ],
        ),
      ),
    );
  }
}
