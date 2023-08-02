import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uangku_getx/app/modules/main/controllers/main_controller.dart';

// ignore: must_be_immutable
class CardHistoryHome extends StatelessWidget {
  CardHistoryHome({
    super.key,
  });
  MainController homeC = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text("Rp.20.000"),
        subtitle: Text("Makan Siang"),
        leading: Container(
          child: homeC.isIncome.value
              ? Icon(
                  Icons.upload,
                  color: Colors.green,
                )
              : Icon(
                  Icons.download,
                  color: Colors.red,
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
  }
}
