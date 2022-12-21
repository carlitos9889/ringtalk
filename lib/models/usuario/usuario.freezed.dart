// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usuario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return _Usuario.fromJson(json);
}

/// @nodoc
mixin _$Usuario {
  bool get online => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsuarioCopyWith<Usuario> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioCopyWith<$Res> {
  factory $UsuarioCopyWith(Usuario value, $Res Function(Usuario) then) =
      _$UsuarioCopyWithImpl<$Res, Usuario>;
  @useResult
  $Res call({bool online, String email, String nombre, String uid});
}

/// @nodoc
class _$UsuarioCopyWithImpl<$Res, $Val extends Usuario>
    implements $UsuarioCopyWith<$Res> {
  _$UsuarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? online = null,
    Object? email = null,
    Object? nombre = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      online: null == online
          ? _value.online
          : online // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsuarioCopyWith<$Res> implements $UsuarioCopyWith<$Res> {
  factory _$$_UsuarioCopyWith(
          _$_Usuario value, $Res Function(_$_Usuario) then) =
      __$$_UsuarioCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool online, String email, String nombre, String uid});
}

/// @nodoc
class __$$_UsuarioCopyWithImpl<$Res>
    extends _$UsuarioCopyWithImpl<$Res, _$_Usuario>
    implements _$$_UsuarioCopyWith<$Res> {
  __$$_UsuarioCopyWithImpl(_$_Usuario _value, $Res Function(_$_Usuario) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? online = null,
    Object? email = null,
    Object? nombre = null,
    Object? uid = null,
  }) {
    return _then(_$_Usuario(
      online: null == online
          ? _value.online
          : online // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Usuario with DiagnosticableTreeMixin implements _Usuario {
  const _$_Usuario(
      {required this.online,
      required this.email,
      required this.nombre,
      required this.uid});

  factory _$_Usuario.fromJson(Map<String, dynamic> json) =>
      _$$_UsuarioFromJson(json);

  @override
  final bool online;
  @override
  final String email;
  @override
  final String nombre;
  @override
  final String uid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Usuario(online: $online, email: $email, nombre: $nombre, uid: $uid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Usuario'))
      ..add(DiagnosticsProperty('online', online))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('nombre', nombre))
      ..add(DiagnosticsProperty('uid', uid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Usuario &&
            (identical(other.online, online) || other.online == online) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, online, email, nombre, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsuarioCopyWith<_$_Usuario> get copyWith =>
      __$$_UsuarioCopyWithImpl<_$_Usuario>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsuarioToJson(
      this,
    );
  }
}

abstract class _Usuario implements Usuario {
  const factory _Usuario(
      {required final bool online,
      required final String email,
      required final String nombre,
      required final String uid}) = _$_Usuario;

  factory _Usuario.fromJson(Map<String, dynamic> json) = _$_Usuario.fromJson;

  @override
  bool get online;
  @override
  String get email;
  @override
  String get nombre;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$_UsuarioCopyWith<_$_Usuario> get copyWith =>
      throw _privateConstructorUsedError;
}
