import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uangku_getx/app/data/models/category_model.dart';
import 'package:uangku_getx/app/data/providers/category_provider.dart';
import 'package:uangku_getx/app/modules/main/controllers/main_controller.dart';

class CategoryController extends MainController {
  TextEditingController ctgTC = TextEditingController();
  final supabase = Supabase.instance.client;
  @override
  void onClose() {
    print("hapusss");
  }

  Future<List<Categories>> getCategoriesByType(int type) async {
    return await CategoryProvider.getCategoriesByType(type);
  }

  void postCategory(String name, int type) async {
    return CategoryProvider.postCategory(name, type);
  }
}
