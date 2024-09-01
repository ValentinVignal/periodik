// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signal_with_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignalWithState {
  Signal get signal => throw _privateConstructorUsedError;
  PointState get point => throw _privateConstructorUsedError;

  /// Create a copy of SignalWithState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignalWithStateCopyWith<SignalWithState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignalWithStateCopyWith<$Res> {
  factory $SignalWithStateCopyWith(
          SignalWithState value, $Res Function(SignalWithState) then) =
      _$SignalWithStateCopyWithImpl<$Res, SignalWithState>;
  @useResult
  $Res call({Signal signal, PointState point});

  $SignalCopyWith<$Res> get signal;
}

/// @nodoc
class _$SignalWithStateCopyWithImpl<$Res, $Val extends SignalWithState>
    implements $SignalWithStateCopyWith<$Res> {
  _$SignalWithStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignalWithState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signal = null,
    Object? point = null,
  }) {
    return _then(_value.copyWith(
      signal: null == signal
          ? _value.signal
          : signal // ignore: cast_nullable_to_non_nullable
              as Signal,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as PointState,
    ) as $Val);
  }

  /// Create a copy of SignalWithState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignalCopyWith<$Res> get signal {
    return $SignalCopyWith<$Res>(_value.signal, (value) {
      return _then(_value.copyWith(signal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignalWithStateImplCopyWith<$Res>
    implements $SignalWithStateCopyWith<$Res> {
  factory _$$SignalWithStateImplCopyWith(_$SignalWithStateImpl value,
          $Res Function(_$SignalWithStateImpl) then) =
      __$$SignalWithStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Signal signal, PointState point});

  @override
  $SignalCopyWith<$Res> get signal;
}

/// @nodoc
class __$$SignalWithStateImplCopyWithImpl<$Res>
    extends _$SignalWithStateCopyWithImpl<$Res, _$SignalWithStateImpl>
    implements _$$SignalWithStateImplCopyWith<$Res> {
  __$$SignalWithStateImplCopyWithImpl(
      _$SignalWithStateImpl _value, $Res Function(_$SignalWithStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignalWithState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signal = null,
    Object? point = null,
  }) {
    return _then(_$SignalWithStateImpl(
      signal: null == signal
          ? _value.signal
          : signal // ignore: cast_nullable_to_non_nullable
              as Signal,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as PointState,
    ));
  }
}

/// @nodoc

class _$SignalWithStateImpl implements _SignalWithState {
  const _$SignalWithStateImpl({required this.signal, required this.point});

  @override
  final Signal signal;
  @override
  final PointState point;

  @override
  String toString() {
    return 'SignalWithState(signal: $signal, point: $point)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignalWithStateImpl &&
            (identical(other.signal, signal) || other.signal == signal) &&
            (identical(other.point, point) || other.point == point));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signal, point);

  /// Create a copy of SignalWithState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignalWithStateImplCopyWith<_$SignalWithStateImpl> get copyWith =>
      __$$SignalWithStateImplCopyWithImpl<_$SignalWithStateImpl>(
          this, _$identity);
}

abstract class _SignalWithState implements SignalWithState {
  const factory _SignalWithState(
      {required final Signal signal,
      required final PointState point}) = _$SignalWithStateImpl;

  @override
  Signal get signal;
  @override
  PointState get point;

  /// Create a copy of SignalWithState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignalWithStateImplCopyWith<_$SignalWithStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
