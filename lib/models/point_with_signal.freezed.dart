// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_with_signal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PointWithSignal _$PointWithSignalFromJson(Map<String, dynamic> json) {
  return _PointWithSignal.fromJson(json);
}

/// @nodoc
mixin _$PointWithSignal {
  Signal get signal => throw _privateConstructorUsedError;
  Point get point => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointWithSignalCopyWith<PointWithSignal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointWithSignalCopyWith<$Res> {
  factory $PointWithSignalCopyWith(
          PointWithSignal value, $Res Function(PointWithSignal) then) =
      _$PointWithSignalCopyWithImpl<$Res, PointWithSignal>;
  @useResult
  $Res call({Signal signal, Point point});

  $SignalCopyWith<$Res> get signal;
  $PointCopyWith<$Res> get point;
}

/// @nodoc
class _$PointWithSignalCopyWithImpl<$Res, $Val extends PointWithSignal>
    implements $PointWithSignalCopyWith<$Res> {
  _$PointWithSignalCopyWithImpl(this._value, this._then);

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
              as Point,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SignalCopyWith<$Res> get signal {
    return $SignalCopyWith<$Res>(_value.signal, (value) {
      return _then(_value.copyWith(signal: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PointCopyWith<$Res> get point {
    return $PointCopyWith<$Res>(_value.point, (value) {
      return _then(_value.copyWith(point: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PointWithSignalCopyWith<$Res>
    implements $PointWithSignalCopyWith<$Res> {
  factory _$$_PointWithSignalCopyWith(
          _$_PointWithSignal value, $Res Function(_$_PointWithSignal) then) =
      __$$_PointWithSignalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Signal signal, Point point});

  @override
  $SignalCopyWith<$Res> get signal;
  @override
  $PointCopyWith<$Res> get point;
}

/// @nodoc
class __$$_PointWithSignalCopyWithImpl<$Res>
    extends _$PointWithSignalCopyWithImpl<$Res, _$_PointWithSignal>
    implements _$$_PointWithSignalCopyWith<$Res> {
  __$$_PointWithSignalCopyWithImpl(
      _$_PointWithSignal _value, $Res Function(_$_PointWithSignal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signal = null,
    Object? point = null,
  }) {
    return _then(_$_PointWithSignal(
      signal: null == signal
          ? _value.signal
          : signal // ignore: cast_nullable_to_non_nullable
              as Signal,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PointWithSignal extends _PointWithSignal {
  const _$_PointWithSignal({required this.signal, required this.point})
      : super._();

  factory _$_PointWithSignal.fromJson(Map<String, dynamic> json) =>
      _$$_PointWithSignalFromJson(json);

  @override
  final Signal signal;
  @override
  final Point point;

  @override
  String toString() {
    return 'PointWithSignal(signal: $signal, point: $point)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointWithSignal &&
            (identical(other.signal, signal) || other.signal == signal) &&
            (identical(other.point, point) || other.point == point));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, signal, point);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PointWithSignalCopyWith<_$_PointWithSignal> get copyWith =>
      __$$_PointWithSignalCopyWithImpl<_$_PointWithSignal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointWithSignalToJson(
      this,
    );
  }
}

abstract class _PointWithSignal extends PointWithSignal {
  const factory _PointWithSignal(
      {required final Signal signal,
      required final Point point}) = _$_PointWithSignal;
  const _PointWithSignal._() : super._();

  factory _PointWithSignal.fromJson(Map<String, dynamic> json) =
      _$_PointWithSignal.fromJson;

  @override
  Signal get signal;
  @override
  Point get point;
  @override
  @JsonKey(ignore: true)
  _$$_PointWithSignalCopyWith<_$_PointWithSignal> get copyWith =>
      throw _privateConstructorUsedError;
}
