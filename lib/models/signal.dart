import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:periodik/utils/json.dart';

part 'signal.freezed.dart';
part 'signal.g.dart';

@freezed
class Signal with _$Signal {
  const factory Signal({
    // It is what freezed recommends.
    //
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required String id,
    required String name,
  }) = _Signal;

  factory Signal.fromJson(Json json) => _$SignalFromJson(json);

  factory Signal.fromJsonDocument(String id, Json document) => Signal.fromJson({
        ...document,
        'id': id,
      });

  const Signal._();
}
