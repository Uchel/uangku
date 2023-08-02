import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uangku_getx/app/modules/main/controllers/category_controller.dart';

// ignore: must_be_immutable
class C1Category extends StatelessWidget {
  C1Category({
    super.key,
  });
  CategoryController ctgC = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.width * 0.2,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Switch(
              value: ctgC.isExpense.value,
              onChanged: (value) {
                ctgC.isExpense.toggle().value = value;
              },
              inactiveTrackColor: Colors.green[200],
              inactiveThumbColor: Colors.green,
              activeColor: Colors.red,
            ),
            IconButton(
                onPressed: () {
                  openDialog();
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }

  void openDialog() {
    Get.dialog(
      Obx(
        () => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text(
                    ctgC.isExpense.value ? "Add Expense" : "Add Income",
                    style: TextStyle(
                      color: ctgC.isExpense.value ? Colors.red : Colors.green,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: ctgC.ctgTC,
                      decoration: InputDecoration(
                        hintText: "Nama",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                          ctgC.ctgTC.clear();
                        },
                        child: Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ctgC.postCategory(
                              ctgC.ctgTC.text, ctgC.isExpense.value ? 1 : 2);
                          // ctgC.supabase.from("categories").insert({
                          //   "name": ctgC.ctgTC.text,
                          //   "type": ctgC.isExpense.value ? 1 : 2
                          // });
                          Get.back();
                          ctgC.ctgTC.clear();
                        },
                        child: Text("Add"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
