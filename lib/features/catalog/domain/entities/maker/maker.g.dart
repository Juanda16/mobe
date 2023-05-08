// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Maker _$$_MakerFromJson(Map<String, dynamic> json) => _$_Maker(
      id: json['id'] as int,
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String?,
      qualification: json['qualification'] as num?,
      vendor_id: json['vendor_id'] as int?,
    );

Map<String, dynamic> _$$_MakerToJson(_$_Maker instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoUrl': instance.logoUrl,
      'qualification': instance.qualification,
      'vendor_id': instance.vendor_id,
    };
