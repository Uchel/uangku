import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uangku_getx/app/data/models/transacion_model.dart';

class TransactionProvider {
  static final supabase = Supabase.instance.client;
/*========================= Transaction ============================*/
  static void postTransaction(
      String name, int? categoryId, String transactionDate, int amount) async {
    await supabase.from("transaction").insert({
      "name": name,
      "categoryid": categoryId,
      "transaction_date": transactionDate,
      "amount": amount
    });
  }
}
