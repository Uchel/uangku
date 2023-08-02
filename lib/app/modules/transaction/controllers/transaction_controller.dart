import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/category_model.dart';
import '../../../data/providers/category_provider.dart';

class TransactionController extends GetxController {
  var isExpense = true.obs;
  var outComeList =
      <String>["Makan dan Minum", "Transportasi", "Nonton film"].obs;
  late var dropDownValue = outComeList.first.obs;
  var selected = "".obs;
  TextEditingController amountTC = TextEditingController();
  TextEditingController nameTC = TextEditingController();
  Categories? selectedCategory;
  TextEditingController dateTC = TextEditingController();

  void setSelectedCategory(Categories? category) {
    selectedCategory = category;
    update();
  }

  bool compareCategories(Categories category1, Categories category2) {
    return category1.id ==
        category2
            .id; // Bandingkan berdasarkan properti yang unik, misalnya 'id'.
  }

  Future<List<Categories>> getCategoriesByType(int type) async {
    return await CategoryProvider.getCategoriesByType(type);
  }
}
