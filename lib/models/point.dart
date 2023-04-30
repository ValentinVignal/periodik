import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:periodik/utils/json.dart';
import 'package:periodik/utils/timestamp_date_time_converter.dart';

part 'point.freezed.dart';
part 'point.g.dart';

@freezed
class Point with _$Point {
  const factory Point({
    // It is what freezed recommends.
    //
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required String id,
    @TimestampDateTimeConverter() required DateTime date,
    @Default(false) bool state,
  }) = _Point;

  factory Point.fromJson(Json json) => _$PointFromJson(json);

  factory Point.fromJsonDocument(String id, Json document) => Point.fromJson({
        ...document,
        'id': id,
      });

  const Point._();
}
