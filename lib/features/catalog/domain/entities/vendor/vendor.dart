import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor.freezed.dart';

part 'vendor.g.dart';

@freezed
class Vendor with _$Vendor {
  const factory Vendor(
      {required int id,
      required String name,
      String? phone,
      String? email,
      String? address,
      String? city,
      String? country,
      @Default(0.0) double latitude,
      @Default(0.0) double longitude}) = _Vendor;

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
}
