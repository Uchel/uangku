import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uangku_getx/app/data/models/category_model.dart';
import 'package:uangku_getx/app/modules/main/controllers/category_controller.dart';

// ignore: must_be_immutable
class C2Category extends StatelessWidget {
  C2Category({
    super.key,
  });
  late CategoryController ctgC = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => FutureBuilder<List<Categories>>(
            future: ctgC.getCategoriesByType(ctgC.isExpense.value ? 1 : 2),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snap.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text("${snap.data![index].name}"),
                      leading: Container(
                        child: ctgC.isExpense.value
                            ? Icon(
                                Icons.download,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.upload,
                                color: Colors.green,
                              ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
