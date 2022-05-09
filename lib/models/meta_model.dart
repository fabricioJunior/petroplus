class MetaModel {
  MetaModel({
    this.totalItems,
    this.itemCount,
    this.itemsPerPage,
    this.totalPages,
    this.currentPage,
  });

  num? totalItems;
  num? itemCount;
  num? itemsPerPage;
  num? totalPages;
  num? currentPage;

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        totalItems: json["totalItems"],
        itemCount: json["itemCount"],
        itemsPerPage: json["itemsPerPage"],
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "itemCount": itemCount,
        "itemsPerPage": itemsPerPage,
        "totalPages": totalPages,
        "currentPage": currentPage,
      };
}
