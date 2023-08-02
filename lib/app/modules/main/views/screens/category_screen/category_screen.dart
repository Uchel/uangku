import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uangku_getx/app/modules/main/views/screens/category_screen/widgets/c1_category.dart';
import 'package:uangku_getx/app/modules/main/views/screens/category_screen/widgets/c2_category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.white,
      width: Get.width,
      height: Get.height,
      child: Column(
        children: [
          /* tombol switch dan  IconButton add*/
          C1Category(),
          /* List card history */
          C2Category(),
        ],
      ),
    );
  }
}
