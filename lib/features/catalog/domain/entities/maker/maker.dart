import 'package:freezed_annotation/freezed_annotation.dart';

part 'maker.freezed.dart';

part 'maker.g.dart';

@freezed
class Maker with _$Maker {
  /// Constructor receiving all required data
  const factory Maker(
      {required int id,
      required String name,
      String? logoUrl,
      num? qualification,
      int? vendor_id}) = _Maker;

  factory Maker.fromJson(Map<String, dynamic> json) => _$MakerFromJson(json);
}
