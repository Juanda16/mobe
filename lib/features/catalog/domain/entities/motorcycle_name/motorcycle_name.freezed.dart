// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'motorcycle_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MotorcycleName _$MotorcycleNameFromJson(Map<String, dynamic> json) {
  return _MotorcycleName.fromJson(json);
}

/// @nodoc
mixin _$MotorcycleName {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MotorcycleNameCopyWith<MotorcycleName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotorcycleNameCopyWith<$Res> {
  factory $MotorcycleNameCopyWith(
          MotorcycleName value, $Res Function(MotorcycleName) then) =
      _$MotorcycleNameCopyWithImpl<$Res, MotorcycleName>;
  @useResult
  $Res call({String name, String id});
}

/// @nodoc
class _$MotorcycleNameCopyWithImpl<$Res, $Val extends MotorcycleName>
    implements $MotorcycleNameCopyWith<$Res> {
  _$MotorcycleNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MotorcycleNameCopyWith<$Res>
    implements $MotorcycleNameCopyWith<$Res> {
  factory _$$_MotorcycleNameCopyWith(
          _$_MotorcycleName value, $Res Function(_$_MotorcycleName) then) =
      __$$_MotorcycleNameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id});
}

/// @nodoc
class __$$_MotorcycleNameCopyWithImpl<$Res>
    extends _$MotorcycleNameCopyWithImpl<$Res, _$_MotorcycleName>
    implements _$$_MotorcycleNameCopyWith<$Res> {
  __$$_MotorcycleNameCopyWithImpl(
      _$_MotorcycleName _value, $Res Function(_$_MotorcycleName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_$_MotorcycleName(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MotorcycleName implements _MotorcycleName {
  const _$_MotorcycleName({required this.name, required this.id});

  factory _$_MotorcycleName.fromJson(Map<String, dynamic> json) =>
      _$$_MotorcycleNameFromJson(json);

  @override
  final String name;
  @override
  final String id;

  @override
  String toString() {
    return 'MotorcycleName(name: $name, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MotorcycleName &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MotorcycleNameCopyWith<_$_MotorcycleName> get copyWith =>
      __$$_MotorcycleNameCopyWithImpl<_$_MotorcycleName>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MotorcycleNameToJson(
      this,
    );
  }
}

abstract class _MotorcycleName implements MotorcycleName {
  const factory _MotorcycleName(
      {required final String name,
      required final String id}) = _$_MotorcycleName;

  factory _MotorcycleName.fromJson(Map<String, dynamic> json) =
      _$_MotorcycleName.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_MotorcycleNameCopyWith<_$_MotorcycleName> get copyWith =>
      throw _privateConstructorUsedError;
}
