// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Vendor _$$_VendorFromJson(Map<String, dynamic> json) => _$_Vendor(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_VendorToJson(_$_Vendor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
