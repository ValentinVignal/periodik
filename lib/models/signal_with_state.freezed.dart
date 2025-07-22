// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signal_with_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignalWithState {
  Signal get signal;
  PointState get point;

  /// Create a copy of SignalWithState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignalWithStateCopyWith<SignalWithState> get copyWith =>
      _$SignalWithStateCopyWithImpl<SignalWithState>(
          this as SignalWithState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignalWithState &&
            (identical(other.signal, signal) || other.signal == signal) &&
            (identical(other.point, point) || other.point == point));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signal, point);

  @override
  String toString() {
    return 'SignalWithState(signal: $signal, point: $point)';
  }
}

/// @nodoc
abstract mixin class $SignalWithStateCopyWith<$Res> {
  factory $SignalWithStateCopyWith(
          SignalWithState value, $Res Function(SignalWithState) _then) =
      _$SignalWithStateCopyWithImpl;
  @useResult
  $Res call({Signal signal, PointState point});

  $SignalCopyWith<$Res> get signal;
}

/// @nodoc
class _$SignalWithStateCopyWithImpl<$Res>
    implements $SignalWithStateCopyWith<$Res> {
  _$SignalWithStateCopyWithImpl(this._self, this._then);

  final SignalWithState _self;
  final $Res Function(SignalWithState) _then;

  /// Create a copy of SignalWithState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signal = null,
    Object? point = null,
  }) {
    return _then(_self.copyWith(
      signal: null == signal
          ? _self.signal
          : signal // ignore: cast_nullable_to_non_nullable
              as Signal,
      point: null == point
          ? _self.point
          : point // ignore: cast_nullable_to_non_nullable
              as PointState,
    ));
  }

  /// Create a copy of SignalWithState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignalCopyWith<$Res> get signal {
    return $SignalCopyWith<$Res>(_self.signal, (value) {
      return _then(_self.copyWith(signal: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SignalWithState].
extension SignalWithStatePatterns on SignalWithState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignalWithState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignalWithState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignalWithState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignalWithState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignalWithState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignalWithState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Signal signal, PointState point)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignalWithState() when $default != null:
        return $default(_that.signal, _that.point);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Signal signal, PointState point) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignalWithState():
        return $default(_that.signal, _that.point);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Signal signal, PointState point)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignalWithState() when $default != null:
        return $default(_that.signal, _that.point);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SignalWithState implements SignalWithState {
  const _SignalWithState({required this.signal, required this.point});

  @override
  final Signal signal;
  @override
  final PointState point;

  /// Create a copy of SignalWithState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignalWithStateCopyWith<_SignalWithState> get copyWith =>
      __$SignalWithStateCopyWithImpl<_SignalWithState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignalWithState &&
            (identical(other.signal, signal) || other.signal == signal) &&
            (identical(other.point, point) || other.point == point));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signal, point);

  @override
  String toString() {
    return 'SignalWithState(signal: $signal, point: $point)';
  }
}

/// @nodoc
abstract mixin class _$SignalWithStateCopyWith<$Res>
    implements $SignalWithStateCopyWith<$Res> {
  factory _$SignalWithStateCopyWith(
          _SignalWithState value, $Res Function(_SignalWithState) _then) =
      __$SignalWithStateCopyWithImpl;
  @override
  @useResult
  $Res call({Signal signal, PointState point});

  @override
  $SignalCopyWith<$Res> get signal;
}

/// @nodoc
class __$SignalWithStateCopyWithImpl<$Res>
    implements _$SignalWithStateCopyWith<$Res> {
  __$SignalWithStateCopyWithImpl(this._self, this._then);

  final _SignalWithState _self;
  final $Res Function(_SignalWithState) _then;

  /// Create a copy of SignalWithState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? signal = null,
    Object? point = null,
  }) {
    return _then(_SignalWithState(
      signal: null == signal
          ? _self.signal
          : signal // ignore: cast_nullable_to_non_nullable
              as Signal,
      point: null == point
          ? _self.point
          : point // ignore: cast_nullable_to_non_nullable
              as PointState,
    ));
  }

  /// Create a copy of SignalWithState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignalCopyWith<$Res> get signal {
    return $SignalCopyWith<$Res>(_self.signal, (value) {
      return _then(_self.copyWith(signal: value));
    });
  }
}

// dart format on
