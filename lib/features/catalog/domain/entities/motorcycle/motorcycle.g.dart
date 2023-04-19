// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motorcycle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Motorcycle _$$_MotorcycleFromJson(Map<String, dynamic> json) =>
    _$_Motorcycle(
      articleCompleteInfo: ArticleCompleteInfo.fromJson(
          json['articleCompleteInfo'] as Map<String, dynamic>),
      engineAndTransmission: EngineAndTransmission.fromJson(
          json['engineAndTransmission'] as Map<String, dynamic>),
      chassisSuspensionBrakesAndWheels:
          ChassisSuspensionBrakesAndWheels.fromJson(
              json['chassisSuspensionBrakesAndWheels'] as Map<String, dynamic>),
      physicalMeasuresAndCapacities: PhysicalMeasuresAndCapacities.fromJson(
          json['physicalMeasuresAndCapacities'] as Map<String, dynamic>),
      otherSpecifications: OtherSpecifications.fromJson(
          json['otherSpecifications'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MotorcycleToJson(_$_Motorcycle instance) =>
    <String, dynamic>{
      'articleCompleteInfo': instance.articleCompleteInfo,
      'engineAndTransmission': instance.engineAndTransmission,
      'chassisSuspensionBrakesAndWheels':
          instance.chassisSuspensionBrakesAndWheels,
      'physicalMeasuresAndCapacities': instance.physicalMeasuresAndCapacities,
      'otherSpecifications': instance.otherSpecifications,
    };

_$_ArticleCompleteInfo _$$_ArticleCompleteInfoFromJson(
        Map<String, dynamic> json) =>
    _$_ArticleCompleteInfo(
      articleID: json['articleID'] as int,
      makeName: json['makeName'] as String,
      modelName: json['modelName'] as String,
      categoryName: json['categoryName'] as String,
      yearName: json['yearName'] as int,
    );

Map<String, dynamic> _$$_ArticleCompleteInfoToJson(
        _$_ArticleCompleteInfo instance) =>
    <String, dynamic>{
      'articleID': instance.articleID,
      'makeName': instance.makeName,
      'modelName': instance.modelName,
      'categoryName': instance.categoryName,
      'yearName': instance.yearName,
    };

_$_EngineAndTransmission _$$_EngineAndTransmissionFromJson(
        Map<String, dynamic> json) =>
    _$_EngineAndTransmission(
      displacementName: json['displacementName'] as String,
      engineTypeName: json['engineTypeName'] as String,
      engineDetailsName: json['engineDetailsName'] as String,
      powerName: json['powerName'] as String,
      torqueName: json['torqueName'] as String,
      compressionName: json['compressionName'] as String,
      boreXStrokeName: json['boreXStrokeName'] as String,
      valvesPerCylinderName: json['valvesPerCylinderName'] as String,
      fuelSystemName: json['fuelSystemName'] as String,
      ignitionName: json['ignitionName'] as String,
      coolingSystemName: json['coolingSystemName'] as String,
      gearboxName: json['gearboxName'] as String,
      transmissionTypeFinalDriveName:
          json['transmissionTypeFinalDriveName'] as String,
      clutchName: json['clutchName'] as String,
      drivelineName: json['drivelineName'] as String,
      fuelConsumptionName: json['fuelConsumptionName'] as String,
      greenhouseGasesName: json['greenhouseGasesName'] as String,
      emissionDetailsName: json['emissionDetailsName'] as String,
    );

Map<String, dynamic> _$$_EngineAndTransmissionToJson(
        _$_EngineAndTransmission instance) =>
    <String, dynamic>{
      'displacementName': instance.displacementName,
      'engineTypeName': instance.engineTypeName,
      'engineDetailsName': instance.engineDetailsName,
      'powerName': instance.powerName,
      'torqueName': instance.torqueName,
      'compressionName': instance.compressionName,
      'boreXStrokeName': instance.boreXStrokeName,
      'valvesPerCylinderName': instance.valvesPerCylinderName,
      'fuelSystemName': instance.fuelSystemName,
      'ignitionName': instance.ignitionName,
      'coolingSystemName': instance.coolingSystemName,
      'gearboxName': instance.gearboxName,
      'transmissionTypeFinalDriveName': instance.transmissionTypeFinalDriveName,
      'clutchName': instance.clutchName,
      'drivelineName': instance.drivelineName,
      'fuelConsumptionName': instance.fuelConsumptionName,
      'greenhouseGasesName': instance.greenhouseGasesName,
      'emissionDetailsName': instance.emissionDetailsName,
    };

_$_ChassisSuspensionBrakesAndWheels
    _$$_ChassisSuspensionBrakesAndWheelsFromJson(Map<String, dynamic> json) =>
        _$_ChassisSuspensionBrakesAndWheels(
          frameTypeName: json['frameTypeName'] as String,
          frontBrakesName: json['frontBrakesName'] as String,
          frontSuspensionName: json['frontSuspensionName'] as String,
          frontTyreName: json['frontTyreName'] as String,
          frontWheelTravelName: json['frontWheelTravelName'] as String,
          rakeName: json['rakeName'] as String,
          rearBrakesName: json['rearBrakesName'] as String,
          rearSuspensionName: json['rearSuspensionName'] as String,
          rearTyreName: json['rearTyreName'] as String,
          rearWheelTravelName: json['rearWheelTravelName'] as String,
          trailName: json['trailName'] as String,
          wheelsName: json['wheelsName'] as String,
        );

Map<String, dynamic> _$$_ChassisSuspensionBrakesAndWheelsToJson(
        _$_ChassisSuspensionBrakesAndWheels instance) =>
    <String, dynamic>{
      'frameTypeName': instance.frameTypeName,
      'frontBrakesName': instance.frontBrakesName,
      'frontSuspensionName': instance.frontSuspensionName,
      'frontTyreName': instance.frontTyreName,
      'frontWheelTravelName': instance.frontWheelTravelName,
      'rakeName': instance.rakeName,
      'rearBrakesName': instance.rearBrakesName,
      'rearSuspensionName': instance.rearSuspensionName,
      'rearTyreName': instance.rearTyreName,
      'rearWheelTravelName': instance.rearWheelTravelName,
      'trailName': instance.trailName,
      'wheelsName': instance.wheelsName,
    };

_$_PhysicalMeasuresAndCapacities _$$_PhysicalMeasuresAndCapacitiesFromJson(
        Map<String, dynamic> json) =>
    _$_PhysicalMeasuresAndCapacities(
      fuelCapacityName: json['fuelCapacityName'] as String,
      groundClearanceName: json['groundClearanceName'] as String,
      oilCapacityName: json['oilCapacityName'] as String,
      overallHeightName: json['overallHeightName'] as String,
      overallLengthName: json['overallLengthName'] as String,
      overallWidthName: json['overallWidthName'] as String,
      seatHeightName: json['seatHeightName'] as String,
      weightInclOilGasEtcName: json['weightInclOilGasEtcName'] as String,
    );

Map<String, dynamic> _$$_PhysicalMeasuresAndCapacitiesToJson(
        _$_PhysicalMeasuresAndCapacities instance) =>
    <String, dynamic>{
      'fuelCapacityName': instance.fuelCapacityName,
      'groundClearanceName': instance.groundClearanceName,
      'oilCapacityName': instance.oilCapacityName,
      'overallHeightName': instance.overallHeightName,
      'overallLengthName': instance.overallLengthName,
      'overallWidthName': instance.overallWidthName,
      'seatHeightName': instance.seatHeightName,
      'weightInclOilGasEtcName': instance.weightInclOilGasEtcName,
    };

_$_OtherSpecifications _$$_OtherSpecificationsFromJson(
        Map<String, dynamic> json) =>
    _$_OtherSpecifications(
      colorOptionsName: json['colorOptionsName'] as String,
      electricalName: json['electricalName'] as String,
      commentsName: json['commentsName'] as String,
    );

Map<String, dynamic> _$$_OtherSpecificationsToJson(
        _$_OtherSpecifications instance) =>
    <String, dynamic>{
      'colorOptionsName': instance.colorOptionsName,
      'electricalName': instance.electricalName,
      'commentsName': instance.commentsName,
    };
