// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signal_with_points.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignalWithPoints {
  Signal get signal;
  List<Point> get points;

  /// Create a copy of SignalWithPoints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignalWithPointsCopyWith<SignalWithPoints> get copyWith =>
      _$SignalWithPointsCopyWithImpl<SignalWithPoints>(
          this as SignalWithPoints, _$identity);

  /// Serializes this SignalWithPoints to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignalWithPoints &&
            (identical(other.signal, signal) || other.signal == signal) &&
            const DeepCollectionEquality().equals(other.points, points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, signal, const DeepCollectionEquality().hash(points));

  @override
  String toString() {
    return 'SignalWithPoints(signal: $signal, points: $points)';
  }
}

/// @nodoc
abstract mixin class $SignalWithPointsCopyWith<$Res> {
  factory $SignalWithPointsCopyWith(
          SignalWithPoints value, $Res Function(SignalWithPoints) _then) =
      _$SignalWithPointsCopyWithImpl;
  @useResult
  $Res call({Signal signal, List<Point> points});

  $SignalCopyWith<$Res> get signal;
}

/// @nodoc
class _$SignalWithPointsCopyWithImpl<$Res>
    implements $SignalWithPointsCopyWith<$Res> {
  _$SignalWithPointsCopyWithImpl(this._self, this._then);

  final SignalWithPoints _self;
  final $Res Function(SignalWithPoints) _then;

  /// Create a copy of SignalWithPoints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signal = null,
    Object? points = null,
  }) {
    return _then(_self.copyWith(
      signal: null == signal
          ? _self.signal
          : signal // ignore: cast_nullable_to_non_nullable
              as Signal,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point>,
    ));
  }

  /// Create a copy of SignalWithPoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignalCopyWith<$Res> get signal {
    return $SignalCopyWith<$Res>(_self.signal, (value) {
      return _then(_self.copyWith(signal: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SignalWithPoints].
extension SignalWithPointsPatterns on SignalWithPoints {
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
    TResult Function(_SignalWithPoints value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignalWithPoints() when $default != null:
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
    TResult Function(_SignalWithPoints value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignalWithPoints():
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
    TResult? Function(_SignalWithPoints value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignalWithPoints() when $default != null:
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
    TResult Function(Signal signal, List<Point> points)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignalWithPoints() when $default != null:
        return $default(_that.signal, _that.points);
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
    TResult Function(Signal signal, List<Point> points) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignalWithPoints():
        return $default(_that.signal, _that.points);
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
    TResult? Function(Signal signal, List<Point> points)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignalWithPoints() when $default != null:
        return $default(_that.signal, _that.points);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SignalWithPoints extends SignalWithPoints {
  const _SignalWithPoints(
      {required this.signal, required final List<Point> points})
      : _points = points,
        super._();
  factory _SignalWithPoints.fromJson(Map<String, dynamic> json) =>
      _$SignalWithPointsFromJson(json);

  @override
  final Signal signal;
  final List<Point> _points;
  @override
  List<Point> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  /// Create a copy of SignalWithPoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignalWithPointsCopyWith<_SignalWithPoints> get copyWith =>
      __$SignalWithPointsCopyWithImpl<_SignalWithPoints>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SignalWithPointsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignalWithPoints &&
            (identical(other.signal, signal) || other.signal == signal) &&
            const DeepCollectionEquality().equals(other._points, _points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, signal, const DeepCollectionEquality().hash(_points));

  @override
  String toString() {
    return 'SignalWithPoints(signal: $signal, points: $points)';
  }
}

/// @nodoc
abstract mixin class _$SignalWithPointsCopyWith<$Res>
    implements $SignalWithPointsCopyWith<$Res> {
  factory _$SignalWithPointsCopyWith(
          _SignalWithPoints value, $Res Function(_SignalWithPoints) _then) =
      __$SignalWithPointsCopyWithImpl;
  @override
  @useResult
  $Res call({Signal signal, List<Point> points});

  @override
  $SignalCopyWith<$Res> get signal;
}

/// @nodoc
class __$SignalWithPointsCopyWithImpl<$Res>
    implements _$SignalWithPointsCopyWith<$Res> {
  __$SignalWithPointsCopyWithImpl(this._self, this._then);

  final _SignalWithPoints _self;
  final $Res Function(_SignalWithPoints) _then;

  /// Create a copy of SignalWithPoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? signal = null,
    Object? points = null,
  }) {
    return _then(_SignalWithPoints(
      signal: null == signal
          ? _self.signal
          : signal // ignore: cast_nullable_to_non_nullable
              as Signal,
      points: null == points
          ? _self._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point>,
    ));
  }

  /// Create a copy of SignalWithPoints
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
