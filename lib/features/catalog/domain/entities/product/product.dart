import 'package:freezed_annotation/freezed_annotation.dart';

import '../vendor/store.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    String? type,
    String? picUrl,
    String? description,
    String? price,
    @JsonKey(name: 'store') String? storeName,
    @JsonKey(name: 'store2') Store? store,
    @Default(0.0) double rating,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
