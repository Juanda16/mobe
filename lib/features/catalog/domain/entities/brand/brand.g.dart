// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Brand _$$_BrandFromJson(Map<String, dynamic> json) => _$_Brand(
      name: json['name'] as String,
      vendor: json['vendor'] == null
          ? null
          : Vendor.fromJson(json['vendor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BrandToJson(_$_Brand instance) => <String, dynamic>{
      'name': instance.name,
      'vendor': instance.vendor,
    };
