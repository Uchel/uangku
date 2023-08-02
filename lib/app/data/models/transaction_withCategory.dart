import 'package:uangku_getx/app/data/models/category_model.dart';

class TransactionsWithCategory {
  int? id;
  String? name;
  Categories? categoryId;
  int? amount;
  String? transactionDate;
  String? createdAt;
  String? updatedAt;

  TransactionsWithCategory(
      {this.id,
      this.name,
      this.categoryId,
      this.amount,
      this.transactionDate,
      this.createdAt,
      this.updatedAt});

//untuk satu row
  TransactionsWithCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['type'];
    amount = json["amount"];
    transactionDate = json["transaction_date"];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  static List<TransactionsWithCategory> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => TransactionsWithCategory.fromJson(e)).toList();
  }
}
