import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uangku_getx/app/data/models/category_model.dart';
import 'package:uangku_getx/app/data/providers/transaction_provider.dart';

import '../../controllers/transaction_controller.dart';

class C2TrxFormButton extends StatelessWidget {
  const C2TrxFormButton({
    super.key,
    required this.controller,
  });

  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*======== form nominal outcome ====== */
        Container(
          margin: EdgeInsets.only(
            bottom: 10,
            top: 10,
          ),
          height: Get.width * 0.15,
          child: TextField(
            controller: controller.nameTC,
            autocorrect: false,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: 10,
            top: 10,
          ),
          height: Get.width * 0.15,
          child: TextField(
            controller: controller.amountTC,
            autocorrect: false,
            decoration: InputDecoration(
              labelText: "Nominal",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),

        /*====== form Kategory Outcome =====*/
        Obx(
          () => FutureBuilder<List<Categories>>(
            future: controller
                .getCategoriesByType(controller.isExpense.value ? 1 : 2),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snap.data!.length == 0) {
                return Container(
                  height: Get.width * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text("Tidak ada data"),
                  ),
                );
              }
              return DropdownSearch<Categories>(
                mode: Mode.MENU,
                showSelectedItem: true,
                items: snap.data ??
                    [], // Tambahkan null check pada snap.data dan berikan nilai default jika bernilai null.
                label: "Pilih Kategori",
                compareFn: (Categories? selectedItem, Categories? newItem) {
                  if (selectedItem == null || newItem == null) {
                    return false; // Tambahkan penanganan untuk nilai null pada compareFn.
                  }
                  return controller.compareCategories(selectedItem, newItem);
                },
                onChanged: (Categories? value) {
                  controller.setSelectedCategory(value);
                  print(value!.id);
                },
              );
            },
          ),
        ),
        SizedBox(height: 15),
        /*======    == Form Tanggal ==    =====*/
        Container(
          height: Get.width * 0.15,
          child: TextField(
            controller: controller.dateTC,
            decoration: InputDecoration(
              labelText: "Enter Date",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  // Gabungkan tanggal dan waktu yang dipilih
                  DateTime combinedDateTime = DateTime(
                    pickedDate.year,
                    pickedDate.month,
                    pickedDate.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  );

                  // Sekarang Anda memiliki DateTime lengkap dengan tanggal dan waktu
                  // Format sesuai keinginan Anda
                  String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss')
                      .format(combinedDateTime);
                  controller.dateTC.text = formattedDateTime;
                }
              }
            },
          ),
        ),
        /*======    == Button Submit ==    =====*/
        Container(
          margin: EdgeInsets.only(top: 15),
          width: Get.width,
          height: Get.width * 0.14,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              TransactionProvider.postTransaction(
                  controller.nameTC.text,
                  controller.selectedCategory!.id,
                  controller.dateTC.text,
                  int.parse(controller.amountTC.text));
              print(controller.nameTC.text);
              print(controller.amountTC.text);
              print(controller.dateTC.text);
              print(controller.selectedCategory!.id);
              controller.nameTC.clear();
              controller.amountTC.clear();
              controller.dateTC.clear();
            },
            child: Text("Submit"),
          ),
        )
      ],
    );
  }
}
