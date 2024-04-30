import 'package:freezed_annotation/freezed_annotation.dart';

import '../vendor/store.dart';

part 'brand.freezed.dart';
part 'brand.g.dart';

@freezed
class Brand with _$Brand {
  const factory Brand({
    required String name,
    Store? vendor, // New field for vendor information
  }) = _Brand;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}
