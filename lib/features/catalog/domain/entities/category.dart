import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  /// Constructor receiving all required data
  const factory Category({
    required int id,
    required String name,
  }) = _Category;
}
