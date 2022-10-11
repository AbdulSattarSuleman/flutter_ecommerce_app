// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  ProductsModel({
    required this.itemsbyCategory,
    this.pendingCart,
  });

  List<ItemsbyCategory> itemsbyCategory;
  dynamic pendingCart;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        itemsbyCategory: List<ItemsbyCategory>.from(
            json["itemsbyCategory"].map((x) => ItemsbyCategory.fromJson(x))),
        pendingCart: json["pendingCart"],
      );

  Map<String, dynamic> toJson() => {
        "itemsbyCategory":
            List<dynamic>.from(itemsbyCategory.map((x) => x.toJson())),
        "pendingCart": pendingCart,
      };
}

class ItemsbyCategory {
  ItemsbyCategory({
    required this.categoryId,
    required this.category,
    required this.products,
  });

  int categoryId;
  String category;
  List<Product> products;

  factory ItemsbyCategory.fromJson(Map<String, dynamic> json) =>
      ItemsbyCategory(
        categoryId: json["categoryId"],
        category: json["category"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "category": category,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.productId,
    required this.name,
    required this.price,
  });

  int productId;
  String name;
  String price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "price": price,
      };
}
