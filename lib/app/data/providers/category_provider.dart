import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uangku_getx/app/data/models/category_model.dart';

class CategoryProvider {
  static final supabase = Supabase.instance.client;
/* =================== Category ====================================== */

  static Future<List<Categories>> getCategoriesByType(int type) async {
    List<dynamic> response = await supabase
        .from('categories')
        .select("id, name, type, created_at, updated_at")
        .eq("type", type);
    return Categories.fromJsonList(response);
  }

  static void postCategory(String name, int type) async {
    await supabase.from("categories").insert({"name": name, "type": type});
  }
}
