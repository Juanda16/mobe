// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Vendor _$VendorFromJson(Map<String, dynamic> json) {
  return _Vendor.fromJson(json);
}

/// @nodoc
mixin _$Vendor {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorCopyWith<Vendor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorCopyWith<$Res> {
  factory $VendorCopyWith(Vendor value, $Res Function(Vendor) then) =
      _$VendorCopyWithImpl<$Res, Vendor>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? phone,
      String? email,
      String? address,
      String? city,
      String? country,
      double latitude,
      double longitude});
}

/// @nodoc
class _$VendorCopyWithImpl<$Res, $Val extends Vendor>
    implements $VendorCopyWith<$Res> {
  _$VendorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? latitude = null,
    Object? longitude = null,
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
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VendorCopyWith<$Res> implements $VendorCopyWith<$Res> {
  factory _$$_VendorCopyWith(_$_Vendor value, $Res Function(_$_Vendor) then) =
      __$$_VendorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? phone,
      String? email,
      String? address,
      String? city,
      String? country,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$_VendorCopyWithImpl<$Res>
    extends _$VendorCopyWithImpl<$Res, _$_Vendor>
    implements _$$_VendorCopyWith<$Res> {
  __$$_VendorCopyWithImpl(_$_Vendor _value, $Res Function(_$_Vendor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$_Vendor(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Vendor implements _Vendor {
  const _$_Vendor(
      {required this.id,
      required this.name,
      this.phone,
      this.email,
      this.address,
      this.city,
      this.country,
      this.latitude = 0.0,
      this.longitude = 0.0});

  factory _$_Vendor.fromJson(Map<String, dynamic> json) =>
      _$$_VendorFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? country;
  @override
  @JsonKey()
  final double latitude;
  @override
  @JsonKey()
  final double longitude;

  @override
  String toString() {
    return 'Vendor(id: $id, name: $name, phone: $phone, email: $email, address: $address, city: $city, country: $country, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Vendor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone, email, address,
      city, country, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VendorCopyWith<_$_Vendor> get copyWith =>
      __$$_VendorCopyWithImpl<_$_Vendor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VendorToJson(
      this,
    );
  }
}

abstract class _Vendor implements Vendor {
  const factory _Vendor(
      {required final int id,
      required final String name,
      final String? phone,
      final String? email,
      final String? address,
      final String? city,
      final String? country,
      final double latitude,
      final double longitude}) = _$_Vendor;

  factory _Vendor.fromJson(Map<String, dynamic> json) = _$_Vendor.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get country;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_VendorCopyWith<_$_Vendor> get copyWith =>
      throw _privateConstructorUsedError;
}
