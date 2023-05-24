// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return _Brand.fromJson(json);
}

/// @nodoc
mixin _$Brand {
  String get name => throw _privateConstructorUsedError;
  Vendor? get vendor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrandCopyWith<Brand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandCopyWith<$Res> {
  factory $BrandCopyWith(Brand value, $Res Function(Brand) then) =
      _$BrandCopyWithImpl<$Res, Brand>;
  @useResult
  $Res call({String name, Vendor? vendor});

  $VendorCopyWith<$Res>? get vendor;
}

/// @nodoc
class _$BrandCopyWithImpl<$Res, $Val extends Brand>
    implements $BrandCopyWith<$Res> {
  _$BrandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? vendor = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VendorCopyWith<$Res>? get vendor {
    if (_value.vendor == null) {
      return null;
    }

    return $VendorCopyWith<$Res>(_value.vendor!, (value) {
      return _then(_value.copyWith(vendor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BrandCopyWith<$Res> implements $BrandCopyWith<$Res> {
  factory _$$_BrandCopyWith(_$_Brand value, $Res Function(_$_Brand) then) =
      __$$_BrandCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, Vendor? vendor});

  @override
  $VendorCopyWith<$Res>? get vendor;
}

/// @nodoc
class __$$_BrandCopyWithImpl<$Res> extends _$BrandCopyWithImpl<$Res, _$_Brand>
    implements _$$_BrandCopyWith<$Res> {
  __$$_BrandCopyWithImpl(_$_Brand _value, $Res Function(_$_Brand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? vendor = freezed,
  }) {
    return _then(_$_Brand(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Brand implements _Brand {
  const _$_Brand({required this.name, this.vendor});

  factory _$_Brand.fromJson(Map<String, dynamic> json) =>
      _$$_BrandFromJson(json);

  @override
  final String name;
  @override
  final Vendor? vendor;

  @override
  String toString() {
    return 'Brand(name: $name, vendor: $vendor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Brand &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vendor, vendor) || other.vendor == vendor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, vendor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BrandCopyWith<_$_Brand> get copyWith =>
      __$$_BrandCopyWithImpl<_$_Brand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BrandToJson(
      this,
    );
  }
}

abstract class _Brand implements Brand {
  const factory _Brand({required final String name, final Vendor? vendor}) =
      _$_Brand;

  factory _Brand.fromJson(Map<String, dynamic> json) = _$_Brand.fromJson;

  @override
  String get name;
  @override
  Vendor? get vendor;
  @override
  @JsonKey(ignore: true)
  _$$_BrandCopyWith<_$_Brand> get copyWith =>
      throw _privateConstructorUsedError;
}
