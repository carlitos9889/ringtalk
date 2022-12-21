// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Usuario _$$_UsuarioFromJson(Map<String, dynamic> json) => _$_Usuario(
      online: json['online'] as bool,
      email: json['email'] as String,
      nombre: json['nombre'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_UsuarioToJson(_$_Usuario instance) =>
    <String, dynamic>{
      'online': instance.online,
      'email': instance.email,
      'nombre': instance.nombre,
      'uid': instance.uid,
    };
