import 'package:freezed_annotation/freezed_annotation.dart';

part 'motorcycle.freezed.dart';
part 'motorcycle.g.dart';

@freezed
abstract class Motorcycle with _$Motorcycle {
  const factory Motorcycle({
    required ArticleCompleteInfo articleCompleteInfo,
    required EngineAndTransmission engineAndTransmission,
    required ChassisSuspensionBrakesAndWheels chassisSuspensionBrakesAndWheels,
    required PhysicalMeasuresAndCapacities physicalMeasuresAndCapacities,
    required OtherSpecifications otherSpecifications,
  }) = _Motorcycle;

  factory Motorcycle.fromJson(Map<String, dynamic> json) =>
      _$MotorcycleFromJson(json);

  const Motorcycle._();
}

@freezed
abstract class ArticleCompleteInfo with _$ArticleCompleteInfo {
  const factory ArticleCompleteInfo({
    required int articleID,
    required String makeName,
    required String modelName,
    required String categoryName,
    required int yearName,
  }) = _ArticleCompleteInfo;

  factory ArticleCompleteInfo.fromJson(Map<String, dynamic> json) =>
      _$ArticleCompleteInfoFromJson(json);
}

@freezed
abstract class EngineAndTransmission with _$EngineAndTransmission {
  const factory EngineAndTransmission({
    required String displacementName,
    required String engineTypeName,
    required String engineDetailsName,
    required String powerName,
    required String torqueName,
    required String compressionName,
    required String boreXStrokeName,
    required String valvesPerCylinderName,
    required String fuelSystemName,
    required String ignitionName,
    required String coolingSystemName,
    required String gearboxName,
    required String transmissionTypeFinalDriveName,
    required String clutchName,
    required String drivelineName,
    required String fuelConsumptionName,
    required String greenhouseGasesName,
    required String emissionDetailsName,
  }) = _EngineAndTransmission;

  factory EngineAndTransmission.fromJson(Map<String, dynamic> json) =>
      _$EngineAndTransmissionFromJson(json);
}

@freezed
abstract class ChassisSuspensionBrakesAndWheels
    with _$ChassisSuspensionBrakesAndWheels {
  const factory ChassisSuspensionBrakesAndWheels({
    required String frameTypeName,
    required String frontBrakesName,
    required String frontSuspensionName,
    required String frontTyreName,
    required String frontWheelTravelName,
    required String rakeName,
    required String rearBrakesName,
    required String rearSuspensionName,
    required String rearTyreName,
    required String rearWheelTravelName,
    required String trailName,
    required String wheelsName,
  }) = _ChassisSuspensionBrakesAndWheels;

  factory ChassisSuspensionBrakesAndWheels.fromJson(
          Map<String, dynamic> json) =>
      _$ChassisSuspensionBrakesAndWheelsFromJson(json);
}

@freezed
abstract class PhysicalMeasuresAndCapacities
    with _$PhysicalMeasuresAndCapacities {
  const factory PhysicalMeasuresAndCapacities({
    required String fuelCapacityName,
    required String groundClearanceName,
    required String oilCapacityName,
    required String overallHeightName,
    required String overallLengthName,
    required String overallWidthName,
    required String seatHeightName,
    required String weightInclOilGasEtcName,
  }) = _PhysicalMeasuresAndCapacities;

  factory PhysicalMeasuresAndCapacities.fromJson(Map<String, dynamic> json) =>
      _$PhysicalMeasuresAndCapacitiesFromJson(json);
}

@freezed
abstract class OtherSpecifications with _$OtherSpecifications {
  const factory OtherSpecifications({
    required String colorOptionsName,
    required String electricalName,
    required String commentsName,
  }) = _OtherSpecifications;

  factory OtherSpecifications.fromJson(Map<String, dynamic> json) =>
      _$OtherSpecificationsFromJson(json);
}
