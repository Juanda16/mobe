import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
class Store with _$Store {
  const factory Store({
    required int id,
    required String name,
    String? phone,
    String? email,
    String? address,
    String? city,
    String? country,
    String? picUrl,
    @Default(0.0) double rating,
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
