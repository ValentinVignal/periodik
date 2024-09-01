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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Signal _$SignalFromJson(Map<String, dynamic> json) {
  return _Signal.fromJson(json);
}

/// @nodoc
mixin _$Signal {
// It is what freezed recommends.
//
// ignore: invalid_annotation_target
  @JsonKey(includeToJson: false)
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get hidden => throw _privateConstructorUsedError;

  /// Serializes this Signal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Signal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignalCopyWith<Signal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignalCopyWith<$Res> {
  factory $SignalCopyWith(Signal value, $Res Function(Signal) then) =
      _$SignalCopyWithImpl<$Res, Signal>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String id, String name, bool hidden});
}

/// @nodoc
class _$SignalCopyWithImpl<$Res, $Val extends Signal>
    implements $SignalCopyWith<$Res> {
  _$SignalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Signal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hidden = null,
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
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignalImplCopyWith<$Res> implements $SignalCopyWith<$Res> {
  factory _$$SignalImplCopyWith(
          _$SignalImpl value, $Res Function(_$SignalImpl) then) =
      __$$SignalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String id, String name, bool hidden});
}

/// @nodoc
class __$$SignalImplCopyWithImpl<$Res>
    extends _$SignalCopyWithImpl<$Res, _$SignalImpl>
    implements _$$SignalImplCopyWith<$Res> {
  __$$SignalImplCopyWithImpl(
      _$SignalImpl _value, $Res Function(_$SignalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Signal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hidden = null,
  }) {
    return _then(_$SignalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignalImpl extends _Signal {
  const _$SignalImpl(
      {@JsonKey(includeToJson: false) required this.id,
      required this.name,
      this.hidden = false})
      : super._();

  factory _$SignalImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignalImplFromJson(json);

// It is what freezed recommends.
//
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final bool hidden;

  @override
  String toString() {
    return 'Signal(id: $id, name: $name, hidden: $hidden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hidden, hidden) || other.hidden == hidden));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, hidden);

  /// Create a copy of Signal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignalImplCopyWith<_$SignalImpl> get copyWith =>
      __$$SignalImplCopyWithImpl<_$SignalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignalImplToJson(
      this,
    );
  }
}

abstract class _Signal extends Signal {
  const factory _Signal(
      {@JsonKey(includeToJson: false) required final String id,
      required final String name,
      final bool hidden}) = _$SignalImpl;
  const _Signal._() : super._();

  factory _Signal.fromJson(Map<String, dynamic> json) = _$SignalImpl.fromJson;

// It is what freezed recommends.
//
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  String get id;
  @override
  String get name;
  @override
  bool get hidden;

  /// Create a copy of Signal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignalImplCopyWith<_$SignalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
