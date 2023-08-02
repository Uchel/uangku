import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uangku_getx/app/data/models/category_model.dart';
import 'package:uangku_getx/app/modules/main/views/screens/category_screen/category_screen.dart';
import 'package:uangku_getx/app/modules/main/views/screens/home_screen/home_screen.dart';

import '../../../data/models/transacion_model.dart';
import '../../../data/providers/transaction_provider.dart';

class MainController extends GetxController {
  var isIncome = false.obs;
  var isExpense = true.obs;
  RxList<String> dateStrings = [
    "2023-07-30 14:25:41.123456",
    "2023-07-25 14:25:41.123456",
    "2023-07-23 14:25:41.123456",
  ].obs;

  List<DateTime> dateEvents() {
    return dateStrings.map((element) => DateTime.parse(element)).toList();
  }

  //untuk ganti screen home dan category
  final RxList<Widget> widgetScreens = [
    HomeScreen(),
    CategoryScreen(),
  ].obs;

  var currentIndex = 0.obs;
  void afterTap(int index) {
    currentIndex.value = index;
  }

  static final supabase = Supabase.instance.client;
  // ==================================================
  List<DateTime> list = [];
  var isLoadingScreen = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Panggil getTransactions() saat controller pertama kali diinisialisasi.
    getTransactions();
    print(list);
  }

  Future<void> getTransactions() async {
    List<dynamic> response = await supabase.from('transaction').select(
        "id, name, categoryid, transaction_date, amount, created_at, updated_at");
    List<Transactions> transactions = Transactions.fromJsonList(response);

    // Buat list DateTime dari properti transactionDate
    list = transactions
        .map((transaction) => DateTime.parse(transaction.transactionDate!))
        .toList();
    isLoadingScreen.value = false;
    // Perbarui tampilan menggunakan update() dari GetX.
    update();
  }
}
