import 'package:json_annotation/json_annotation.dart';
import '../../presentation/features/home/model/BreedItem.dart';

part 'AllBreedsApiModel.g.dart';

@JsonSerializable()
class AllBreedsApiModel {
  final Map<String, List<String>> message;
  final String status;

  AllBreedsApiModel({required this.message, required this.status});

  factory AllBreedsApiModel.fromJson(Map<String, dynamic> json) =>
      _$AllBreedsApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllBreedsApiModelToJson(this);

  bool isSuccessful() {
    return status == 'success';
  }

  List<String> get breeds => message.keys.toList();

  List<BreedItem> mapToBreedItems() {
    return message.entries
        .map((entry) => BreedItem(entry.key, entry.value))
        .toList();
  }
}
