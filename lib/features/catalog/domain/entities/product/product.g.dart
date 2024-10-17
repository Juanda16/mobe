// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String?,
      picUrl: json['picUrl'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      storeName: json['store'] as String?,
      store: json['store2'] == null
          ? null
          : Store.fromJson(json['store2'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'picUrl': instance.picUrl,
      'description': instance.description,
      'price': instance.price,
      'store': instance.storeName,
      'store2': instance.store,
      'rating': instance.rating,
    };
