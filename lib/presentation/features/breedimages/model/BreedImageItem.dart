
class BreedImageItem {
  final String imageUrl;
  final bool isFavourite;

  BreedImageItem({required this.imageUrl, required this.isFavourite});

  BreedImageItem copyWith(String? imageUrl, bool? isFavourite) {
    return BreedImageItem(
      imageUrl: imageUrl ?? this.imageUrl,
      isFavourite: isFavourite ?? this.isFavourite
    );
  }

  factory BreedImageItem.fromJson(Map<String, dynamic> json) {
    return BreedImageItem(imageUrl: json['message'], isFavourite: false);
  }

  Map<String, dynamic> toJson() {
    return {'message': imageUrl};
  }
}
