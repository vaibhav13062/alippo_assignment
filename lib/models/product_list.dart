import 'package:json_annotation/json_annotation.dart';
part 'product_list.g.dart';

@JsonSerializable()
class ProductList {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  ProductList({this.products, this.total, this.skip, this.limit});

  factory ProductList.fromJson(Map<String, dynamic> data) =>
      _$ProductListFromJson(data);

  Map<String, dynamic> toJson() => _$ProductListToJson(this);
}

@JsonSerializable()
class Products {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Products(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  factory Products.fromJson(Map<String, dynamic> data) =>
      _$ProductsFromJson(data);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
