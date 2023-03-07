import 'package:freezed_annotation/freezed_annotation.dart';

part 'maker.freezed.dart';

@freezed
class Maker with _$Maker {
  /// Constructor receiving all required data
  const factory Maker({
    required String id,
    required String name,
  }) = _Maker;
}
