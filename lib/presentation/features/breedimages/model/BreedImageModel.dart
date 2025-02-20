
class BreedImageModel {
  final String imageUrl;

  BreedImageModel({required this.imageUrl});

  factory BreedImageModel.fromJson(Map<String, dynamic> json) {
    return BreedImageModel(
      imageUrl: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': imageUrl,
    };
  }
}