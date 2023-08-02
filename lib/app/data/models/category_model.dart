class Categories {
  int? id;
  String? name;
  int? type;
  String? createdAt;
  String? updatedAt;

  Categories({this.id, this.name, this.type, this.createdAt, this.updatedAt});
  @override
  String toString() {
    return name ?? ''; // Ubah sesuai dengan properti yang ingin Anda tampilkan.
  }

//untuk satu row
  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  static List<Categories> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => Categories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    return data;
  }
}
