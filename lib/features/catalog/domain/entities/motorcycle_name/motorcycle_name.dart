import 'package:freezed_annotation/freezed_annotation.dart';
part 'motorcycle_name.freezed.dart';
part 'motorcycle_name.g.dart';

@freezed
class MotorcycleName with _$MotorcycleName {
  const factory MotorcycleName({
    required String name,
    required String id,
  }) = _MotorcycleName;

  factory MotorcycleName.fromJson(Map<String, dynamic> json) =>
      _$MotorcycleNameFromJson(json);
}
