// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      userName: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      imageUrl: json['imageUrl'] as String?,
      accessToken: json['accessToken'] as String?,
      tokenType: json['tokenType'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'username': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'roles': instance.roles,
      'imageUrl': instance.imageUrl,
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
    };
