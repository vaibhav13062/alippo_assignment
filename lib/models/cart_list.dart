import 'package:json_annotation/json_annotation.dart';
part 'cart_list.g.dart';

@JsonSerializable()
class CartList {
  List<Carts>? carts;
  int? total;
  int? skip;
  int? limit;

  CartList({this.carts, this.total, this.skip, this.limit});

  factory CartList.fromJson(Map<String, dynamic> data) =>
      _$CartListFromJson(data);

  Map<String, dynamic> toJson() => _$CartListToJson(this);
}

@JsonSerializable()
class Carts {
  int? id;
  List<Products>? products;
  int? total;
  int? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Carts(
      {this.id,
      this.products,
      this.total,
      this.discountedTotal,
      this.userId,
      this.totalProducts,
      this.totalQuantity});

  factory Carts.fromJson(Map<String, dynamic> data) => _$CartsFromJson(data);

  Map<String, dynamic> toJson() => _$CartsToJson(this);
}

@JsonSerializable()
class Products {
  int? id;
  String? title;
  int? price;
  int? quantity;
  int? total;
  double? discountPercentage;
  int? discountedPrice;

  Products(
      {this.id,
      this.title,
      this.price,
      this.quantity,
      this.total,
      this.discountPercentage,
      this.discountedPrice});

  factory Products.fromJson(Map<String, dynamic> data) =>
      _$ProductsFromJson(data);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
