// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginResponse _$$_LoginResponseFromJson(Map<String, dynamic> json) =>
    _$_LoginResponse(
      ok: json['ok'] as bool,
      usuario: Usuario.fromJson(json['usuario'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$$_LoginResponseToJson(_$_LoginResponse instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'usuario': instance.usuario,
      'token': instance.token,
    };
