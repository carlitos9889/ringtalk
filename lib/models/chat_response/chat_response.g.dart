// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatResponse _$$_ChatResponseFromJson(Map<String, dynamic> json) =>
    _$_ChatResponse(
      ok: json['ok'] as bool,
      de: json['de'] as String,
      para: json['para'] as String,
      mensages: (json['mensages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChatResponseToJson(_$_ChatResponse instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'de': instance.de,
      'para': instance.para,
      'mensages': instance.mensages,
    };
