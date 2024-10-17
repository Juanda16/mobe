import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  /// Constructor receiving all required data
  const factory User(
      {@JsonKey(name: 'username') String? userName,
      String? email,
      String? password,
      List<String>? roles,
      String? imageUrl,
      @JsonKey(name: 'accessToken') String? accessToken,
      @JsonKey(name: 'tokenType') String? tokenType}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
