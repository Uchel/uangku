class Transactions {
  int? id;
  String? name;
  int? categoryId;
  int? amount;
  String? transactionDate;
  String? createdAt;
  String? updatedAt;

  Transactions(
      {this.id,
      this.name,
      this.categoryId,
      this.amount,
      this.transactionDate,
      this.createdAt,
      this.updatedAt});

//untuk satu row
  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['type'];
    amount = json["amount"];
    transactionDate = json["transaction_date"];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  static List<Transactions> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => Transactions.fromJson(e)).toList();
  }
}
