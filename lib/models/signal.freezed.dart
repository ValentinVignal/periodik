// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Signal _$SignalFromJson(Map<String, dynamic> json) {
  return _Signal.fromJson(json);
}

/// @nodoc
mixin _$Signal {
  @JsonKey(ignore: true)
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignalCopyWith<Signal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignalCopyWith<$Res> {
  factory $SignalCopyWith(Signal value, $Res Function(Signal) then) =
      _$SignalCopyWithImpl<$Res, Signal>;
  @useResult
  $Res call({@JsonKey(ignore: true) String id, String name});
}

/// @nodoc
class _$SignalCopyWithImpl<$Res, $Val extends Signal>
    implements $SignalCopyWith<$Res> {
  _$SignalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignalCopyWith<$Res> implements $SignalCopyWith<$Res> {
  factory _$$_SignalCopyWith(_$_Signal value, $Res Function(_$_Signal) then) =
      __$$_SignalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(ignore: true) String id, String name});
}

/// @nodoc
class __$$_SignalCopyWithImpl<$Res>
    extends _$SignalCopyWithImpl<$Res, _$_Signal>
    implements _$$_SignalCopyWith<$Res> {
  __$$_SignalCopyWithImpl(_$_Signal _value, $Res Function(_$_Signal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_Signal(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Signal extends _Signal {
  const _$_Signal({@JsonKey(ignore: true) this.id = '', required this.name})
      : super._();

  factory _$_Signal.fromJson(Map<String, dynamic> json) =>
      _$$_SignalFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'Signal(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Signal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignalCopyWith<_$_Signal> get copyWith =>
      __$$_SignalCopyWithImpl<_$_Signal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignalToJson(
      this,
    );
  }
}

abstract class _Signal extends Signal {
  const factory _Signal(
      {@JsonKey(ignore: true) final String id,
      required final String name}) = _$_Signal;
  const _Signal._() : super._();

  factory _Signal.fromJson(Map<String, dynamic> json) = _$_Signal.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_SignalCopyWith<_$_Signal> get copyWith =>
      throw _privateConstructorUsedError;
}
