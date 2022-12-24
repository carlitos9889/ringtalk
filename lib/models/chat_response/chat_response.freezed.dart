// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) {
  return _ChatResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatResponse {
  bool get ok => throw _privateConstructorUsedError;
  String get de => throw _privateConstructorUsedError;
  String get para => throw _privateConstructorUsedError;
  List<Message> get mensages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatResponseCopyWith<ChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatResponseCopyWith<$Res> {
  factory $ChatResponseCopyWith(
          ChatResponse value, $Res Function(ChatResponse) then) =
      _$ChatResponseCopyWithImpl<$Res, ChatResponse>;
  @useResult
  $Res call({bool ok, String de, String para, List<Message> mensages});
}

/// @nodoc
class _$ChatResponseCopyWithImpl<$Res, $Val extends ChatResponse>
    implements $ChatResponseCopyWith<$Res> {
  _$ChatResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ok = null,
    Object? de = null,
    Object? para = null,
    Object? mensages = null,
  }) {
    return _then(_value.copyWith(
      ok: null == ok
          ? _value.ok
          : ok // ignore: cast_nullable_to_non_nullable
              as bool,
      de: null == de
          ? _value.de
          : de // ignore: cast_nullable_to_non_nullable
              as String,
      para: null == para
          ? _value.para
          : para // ignore: cast_nullable_to_non_nullable
              as String,
      mensages: null == mensages
          ? _value.mensages
          : mensages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatResponseCopyWith<$Res>
    implements $ChatResponseCopyWith<$Res> {
  factory _$$_ChatResponseCopyWith(
          _$_ChatResponse value, $Res Function(_$_ChatResponse) then) =
      __$$_ChatResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool ok, String de, String para, List<Message> mensages});
}

/// @nodoc
class __$$_ChatResponseCopyWithImpl<$Res>
    extends _$ChatResponseCopyWithImpl<$Res, _$_ChatResponse>
    implements _$$_ChatResponseCopyWith<$Res> {
  __$$_ChatResponseCopyWithImpl(
      _$_ChatResponse _value, $Res Function(_$_ChatResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ok = null,
    Object? de = null,
    Object? para = null,
    Object? mensages = null,
  }) {
    return _then(_$_ChatResponse(
      ok: null == ok
          ? _value.ok
          : ok // ignore: cast_nullable_to_non_nullable
              as bool,
      de: null == de
          ? _value.de
          : de // ignore: cast_nullable_to_non_nullable
              as String,
      para: null == para
          ? _value.para
          : para // ignore: cast_nullable_to_non_nullable
              as String,
      mensages: null == mensages
          ? _value._mensages
          : mensages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatResponse implements _ChatResponse {
  const _$_ChatResponse(
      {required this.ok,
      required this.de,
      required this.para,
      required final List<Message> mensages})
      : _mensages = mensages;

  factory _$_ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ChatResponseFromJson(json);

  @override
  final bool ok;
  @override
  final String de;
  @override
  final String para;
  final List<Message> _mensages;
  @override
  List<Message> get mensages {
    if (_mensages is EqualUnmodifiableListView) return _mensages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mensages);
  }

  @override
  String toString() {
    return 'ChatResponse(ok: $ok, de: $de, para: $para, mensages: $mensages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatResponse &&
            (identical(other.ok, ok) || other.ok == ok) &&
            (identical(other.de, de) || other.de == de) &&
            (identical(other.para, para) || other.para == para) &&
            const DeepCollectionEquality().equals(other._mensages, _mensages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ok, de, para,
      const DeepCollectionEquality().hash(_mensages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatResponseCopyWith<_$_ChatResponse> get copyWith =>
      __$$_ChatResponseCopyWithImpl<_$_ChatResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatResponseToJson(
      this,
    );
  }
}

abstract class _ChatResponse implements ChatResponse {
  const factory _ChatResponse(
      {required final bool ok,
      required final String de,
      required final String para,
      required final List<Message> mensages}) = _$_ChatResponse;

  factory _ChatResponse.fromJson(Map<String, dynamic> json) =
      _$_ChatResponse.fromJson;

  @override
  bool get ok;
  @override
  String get de;
  @override
  String get para;
  @override
  List<Message> get mensages;
  @override
  @JsonKey(ignore: true)
  _$$_ChatResponseCopyWith<_$_ChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
