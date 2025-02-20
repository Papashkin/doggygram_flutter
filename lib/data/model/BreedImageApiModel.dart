
import 'package:json_annotation/json_annotation.dart';

part 'BreedImageApiModel.g.dart';

@JsonSerializable()
class BreedImageApiModel {
  final List<String> message;
  final String status;

  BreedImageApiModel({required this.message, required this.status});

  factory BreedImageApiModel.fromJson(Map<String, dynamic> json) =>
      _$BreedImageApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$BreedImageApiModelToJson(this);

  bool isSuccessful() {
    return status == 'success';
  }
}