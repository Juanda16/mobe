import 'package:freezed_annotation/freezed_annotation.dart';

part 'motorcycle_name.freezed.dart';

part 'motorcycle_name.g.dart';

@freezed
class MotorcycleName with _$MotorcycleName {
  const factory MotorcycleName({
    required int id,
    required String name,
  }) = _MotorcycleName;

  factory MotorcycleName.fromJson(Map<String, dynamic> json) =>
      _$MotorcycleNameFromJson(json);
}
