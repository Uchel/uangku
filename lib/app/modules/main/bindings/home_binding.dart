import 'package:get/get.dart';
import 'package:uangku_getx/app/modules/main/controllers/category_controller.dart';

import '../controllers/main_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    [
      Get.lazyPut<MainController>(
        () => MainController(),
      ),
      Get.lazyPut<CategoryController>(
        () => CategoryController(),
      )
    ];
  }
}
