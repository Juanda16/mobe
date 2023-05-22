// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Maker _$MakerFromJson(Map<String, dynamic> json) {
  return _Maker.fromJson(json);
}

/// @nodoc
mixin _$Maker {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  num? get qualification => throw _privateConstructorUsedError;
  int? get vendor_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MakerCopyWith<Maker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MakerCopyWith<$Res> {
  factory $MakerCopyWith(Maker value, $Res Function(Maker) then) =
      _$MakerCopyWithImpl<$Res, Maker>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? logoUrl,
      num? qualification,
      int? vendor_id});
}

/// @nodoc
class _$MakerCopyWithImpl<$Res, $Val extends Maker>
    implements $MakerCopyWith<$Res> {
  _$MakerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logoUrl = freezed,
    Object? qualification = freezed,
    Object? vendor_id = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      qualification: freezed == qualification
          ? _value.qualification
          : qualification // ignore: cast_nullable_to_non_nullable
              as num?,
      vendor_id: freezed == vendor_id
          ? _value.vendor_id
          : vendor_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MakerCopyWith<$Res> implements $MakerCopyWith<$Res> {
  factory _$$_MakerCopyWith(_$_Maker value, $Res Function(_$_Maker) then) =
      __$$_MakerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? logoUrl,
      num? qualification,
      int? vendor_id});
}

/// @nodoc
class __$$_MakerCopyWithImpl<$Res> extends _$MakerCopyWithImpl<$Res, _$_Maker>
    implements _$$_MakerCopyWith<$Res> {
  __$$_MakerCopyWithImpl(_$_Maker _value, $Res Function(_$_Maker) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logoUrl = freezed,
    Object? qualification = freezed,
    Object? vendor_id = freezed,
  }) {
    return _then(_$_Maker(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      qualification: freezed == qualification
          ? _value.qualification
          : qualification // ignore: cast_nullable_to_non_nullable
              as num?,
      vendor_id: freezed == vendor_id
          ? _value.vendor_id
          : vendor_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Maker implements _Maker {
  const _$_Maker(
      {required this.id,
      required this.name,
      this.logoUrl,
      this.qualification,
      this.vendor_id});

  factory _$_Maker.fromJson(Map<String, dynamic> json) =>
      _$$_MakerFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? logoUrl;
  @override
  final num? qualification;
  @override
  final int? vendor_id;

  @override
  String toString() {
    return 'Maker(id: $id, name: $name, logoUrl: $logoUrl, qualification: $qualification, vendor_id: $vendor_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Maker &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.qualification, qualification) ||
                other.qualification == qualification) &&
            (identical(other.vendor_id, vendor_id) ||
                other.vendor_id == vendor_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, logoUrl, qualification, vendor_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MakerCopyWith<_$_Maker> get copyWith =>
      __$$_MakerCopyWithImpl<_$_Maker>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MakerToJson(
      this,
    );
  }
}

abstract class _Maker implements Maker {
  const factory _Maker(
      {required final int id,
      required final String name,
      final String? logoUrl,
      final num? qualification,
      final int? vendor_id}) = _$_Maker;

  factory _Maker.fromJson(Map<String, dynamic> json) = _$_Maker.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get logoUrl;
  @override
  num? get qualification;
  @override
  int? get vendor_id;
  @override
  @JsonKey(ignore: true)
  _$$_MakerCopyWith<_$_Maker> get copyWith =>
      throw _privateConstructorUsedError;
}
