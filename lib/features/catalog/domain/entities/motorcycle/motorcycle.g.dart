// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motorcycle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Motorcycle _$$_MotorcycleFromJson(Map<String, dynamic> json) =>
    _$_Motorcycle(
      id: json['id'] as int,
      brandId: json['brand_id'] as int,
      url: json['url'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
      year: json['year'] as int?,
      price: json['price'] as String?,
      engineDisplacement: json['engine_displacement'] as String?,
      engineType: json['engine_type'] as String?,
      power: json['power'] as String?,
      torque: json['torque'] as String?,
      transmissionType: json['transmission_type'] as String?,
      frontWheel: json['front_wheel'] as String?,
      rearWheel: json['rear_wheel'] as String?,
      overallDimensions: json['overall_dimensions'] as String?,
      wheelbase: json['wheelbase'] as String?,
      weight: json['weight'] as String?,
      frontBrake: json['front_brake'] as String?,
      rearBrake: json['rear_brake'] as String?,
      frontSuspension: json['front_suspension'] as String?,
      rearSuspension: json['rear_suspension'] as String?,
      startingType: json['starting_type'] as String?,
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MotorcycleToJson(_$_Motorcycle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand_id': instance.brandId,
      'url': instance.url,
      'name': instance.name,
      'image': instance.image,
      'year': instance.year,
      'price': instance.price,
      'engine_displacement': instance.engineDisplacement,
      'engine_type': instance.engineType,
      'power': instance.power,
      'torque': instance.torque,
      'transmission_type': instance.transmissionType,
      'front_wheel': instance.frontWheel,
      'rear_wheel': instance.rearWheel,
      'overall_dimensions': instance.overallDimensions,
      'wheelbase': instance.wheelbase,
      'weight': instance.weight,
      'front_brake': instance.frontBrake,
      'rear_brake': instance.rearBrake,
      'front_suspension': instance.frontSuspension,
      'rear_suspension': instance.rearSuspension,
      'starting_type': instance.startingType,
      'brand': instance.brand,
    };
