// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartList _$CartListFromJson(Map<String, dynamic> json) => CartList(
      carts: (json['carts'] as List<dynamic>?)
          ?.map((e) => Carts.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$CartListToJson(CartList instance) => <String, dynamic>{
      'carts': instance.carts,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };

Carts _$CartsFromJson(Map<String, dynamic> json) => Carts(
      id: json['id'] as int?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      discountedTotal: json['discountedTotal'] as int?,
      userId: json['userId'] as int?,
      totalProducts: json['totalProducts'] as int?,
      totalQuantity: json['totalQuantity'] as int?,
    );

Map<String, dynamic> _$CartsToJson(Carts instance) => <String, dynamic>{
      'id': instance.id,
      'products': instance.products,
      'total': instance.total,
      'discountedTotal': instance.discountedTotal,
      'userId': instance.userId,
      'totalProducts': instance.totalProducts,
      'totalQuantity': instance.totalQuantity,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as int?,
      quantity: json['quantity'] as int?,
      total: json['total'] as int?,
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      discountedPrice: json['discountedPrice'] as int?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'quantity': instance.quantity,
      'total': instance.total,
      'discountPercentage': instance.discountPercentage,
      'discountedPrice': instance.discountedPrice,
    };
