import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uangku_getx/app/routes/app_pages.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoadingScreen.value
          ? Scaffold(
              body: Center(child: CircularProgressIndicator()),
            )
          : Scaffold(
              appBar: (controller.currentIndex.value == 0)
                  ? CalendarAppBar(
                      events: controller.list,
                      onDateChanged: (value) {
                        print(value);
                        print(controller.list);
                      },
                      firstDate: DateTime.now().subtract(Duration(days: 140)),
                      lastDate: DateTime.now().subtract(Duration(days: -4)),
                      white: Colors.white,
                      black: Colors.black,
                      accent: Colors.green,
                      backButton: false,
                      selectedDate: DateTime.now(),
                      /* white untuk warna kontainer yang membungkus tanggal */
                      /* black untuk warna tanggal di detail kalender */
                    )
                  : PreferredSize(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        width: Get.width,
                        height: Get.height * 0.1,
                        padding: EdgeInsets.only(
                          bottom: 10,
                          left: 15,
                        ),
                        color: Colors.transparent,
                        child: Text(
                          "Category",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      preferredSize: Size.fromHeight(100),
                    ),
              /*================================== Body ====================================== */
              body: controller.widgetScreens[controller.currentIndex.value],
              /* ======================== Floating Action Button ===============================*/
              floatingActionButton: Visibility(
                visible: controller.currentIndex.value == 0 ? true : false,
                child: FloatingActionButton(
                  onPressed: () {
                    Get.toNamed(Routes.TRANSACTION);
                  },
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              /*============================ Bottom Navigation ============================ */
              bottomNavigationBar: BottomAppBar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.afterTap(0);
                      },
                      icon: Icon(
                        Icons.home,
                        color: controller.currentIndex.value == 0
                            ? Colors.blue
                            : Colors.black,
                      ),
                    ),
                    SizedBox(width: 50),
                    IconButton(
                      onPressed: () {
                        controller.afterTap(1);
                      },
                      icon: Icon(
                        Icons.list,
                        color: controller.currentIndex.value == 1
                            ? Colors.blue
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

// List<String> date =["2023-07-27 14:25:41.123456", "2023-07-25 14:25:41.123456", "2023-07-23 14:25:41.123456"]
