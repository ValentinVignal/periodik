// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signal_with_points.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignalWithPoints _$SignalWithPointsFromJson(Map<String, dynamic> json) {
  return _SignalWithPoints.fromJson(json);
}

/// @nodoc
mixin _$SignalWithPoints {
  Signal get signal => throw _privateConstructorUsedError;
  List<Point> get points => throw _privateConstructorUsedError;

  /// Serializes this SignalWithPoints to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignalWithPoints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignalWithPointsCopyWith<SignalWithPoints> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignalWithPointsCopyWith<$Res> {
  factory $SignalWithPointsCopyWith(
          SignalWithPoints value, $Res Function(SignalWithPoints) then) =
      _$SignalWithPointsCopyWithImpl<$Res, SignalWithPoints>;
  @useResult
  $Res call({Signal signal, List<Point> points});

  $SignalCopyWith<$Res> get signal;
}

/// @nodoc
class _$SignalWithPointsCopyWithImpl<$Res, $Val extends SignalWithPoints>
    implements $SignalWithPointsCopyWith<$Res> {
  _$SignalWithPointsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignalWithPoints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signal = null,
    Object? points = null,
  }) {
    return _then(_value.copyWith(
      signal: null == signal
          ? _value.signal
          : signal // ignore: cast_nullable_to_non_nullable
              as Signal,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point>,
    ) as $Val);
  }

  /// Create a copy of SignalWithPoints
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
abstract class _$$SignalWithPointsImplCopyWith<$Res>
    implements $SignalWithPointsCopyWith<$Res> {
  factory _$$SignalWithPointsImplCopyWith(_$SignalWithPointsImpl value,
          $Res Function(_$SignalWithPointsImpl) then) =
      __$$SignalWithPointsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Signal signal, List<Point> points});

  @override
  $SignalCopyWith<$Res> get signal;
}

/// @nodoc
class __$$SignalWithPointsImplCopyWithImpl<$Res>
    extends _$SignalWithPointsCopyWithImpl<$Res, _$SignalWithPointsImpl>
    implements _$$SignalWithPointsImplCopyWith<$Res> {
  __$$SignalWithPointsImplCopyWithImpl(_$SignalWithPointsImpl _value,
      $Res Function(_$SignalWithPointsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignalWithPoints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signal = null,
    Object? points = null,
  }) {
    return _then(_$SignalWithPointsImpl(
      signal: null == signal
          ? _value.signal
          : signal // ignore: cast_nullable_to_non_nullable
              as Signal,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignalWithPointsImpl extends _SignalWithPoints {
  const _$SignalWithPointsImpl(
      {required this.signal, required final List<Point> points})
      : _points = points,
        super._();

  factory _$SignalWithPointsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignalWithPointsImplFromJson(json);

  @override
  final Signal signal;
  final List<Point> _points;
  @override
  List<Point> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  String toString() {
    return 'SignalWithPoints(signal: $signal, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignalWithPointsImpl &&
            (identical(other.signal, signal) || other.signal == signal) &&
            const DeepCollectionEquality().equals(other._points, _points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, signal, const DeepCollectionEquality().hash(_points));

  /// Create a copy of SignalWithPoints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignalWithPointsImplCopyWith<_$SignalWithPointsImpl> get copyWith =>
      __$$SignalWithPointsImplCopyWithImpl<_$SignalWithPointsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignalWithPointsImplToJson(
      this,
    );
  }
}

abstract class _SignalWithPoints extends SignalWithPoints {
  const factory _SignalWithPoints(
      {required final Signal signal,
      required final List<Point> points}) = _$SignalWithPointsImpl;
  const _SignalWithPoints._() : super._();

  factory _SignalWithPoints.fromJson(Map<String, dynamic> json) =
      _$SignalWithPointsImpl.fromJson;

  @override
  Signal get signal;
  @override
  List<Point> get points;

  /// Create a copy of SignalWithPoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignalWithPointsImplCopyWith<_$SignalWithPointsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
