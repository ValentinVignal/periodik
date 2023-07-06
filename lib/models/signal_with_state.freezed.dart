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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignalWithState {
  Signal get signal => throw _privateConstructorUsedError;
  PointState get point => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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

  @override
  @pragma('vm:prefer-inline')
  $SignalCopyWith<$Res> get signal {
    return $SignalCopyWith<$Res>(_value.signal, (value) {
      return _then(_value.copyWith(signal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SignalWithStateCopyWith<$Res>
    implements $SignalWithStateCopyWith<$Res> {
  factory _$$_SignalWithStateCopyWith(
          _$_SignalWithState value, $Res Function(_$_SignalWithState) then) =
      __$$_SignalWithStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Signal signal, PointState point});

  @override
  $SignalCopyWith<$Res> get signal;
}

/// @nodoc
class __$$_SignalWithStateCopyWithImpl<$Res>
    extends _$SignalWithStateCopyWithImpl<$Res, _$_SignalWithState>
    implements _$$_SignalWithStateCopyWith<$Res> {
  __$$_SignalWithStateCopyWithImpl(
      _$_SignalWithState _value, $Res Function(_$_SignalWithState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signal = null,
    Object? point = null,
  }) {
    return _then(_$_SignalWithState(
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

class _$_SignalWithState implements _SignalWithState {
  const _$_SignalWithState({required this.signal, required this.point});

  @override
  final Signal signal;
  @override
  final PointState point;

  @override
  String toString() {
    return 'SignalWithState(signal: $signal, point: $point)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignalWithState &&
            (identical(other.signal, signal) || other.signal == signal) &&
            (identical(other.point, point) || other.point == point));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signal, point);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignalWithStateCopyWith<_$_SignalWithState> get copyWith =>
      __$$_SignalWithStateCopyWithImpl<_$_SignalWithState>(this, _$identity);
}

abstract class _SignalWithState implements SignalWithState {
  const factory _SignalWithState(
      {required final Signal signal,
      required final PointState point}) = _$_SignalWithState;

  @override
  Signal get signal;
  @override
  PointState get point;
  @override
  @JsonKey(ignore: true)
  _$$_SignalWithStateCopyWith<_$_SignalWithState> get copyWith =>
      throw _privateConstructorUsedError;
}
