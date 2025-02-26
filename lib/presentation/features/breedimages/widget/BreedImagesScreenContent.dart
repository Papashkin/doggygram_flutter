import 'package:flutter/material.dart';
import '../BreedImagesUiState.dart';
import '../model/BreedImageItem.dart';
import 'BreedImagesListView.dart';

class BreedImagesScreenContent extends StatefulWidget {
  final BreedImagesUiState state;
  final Function(BreedImageItem) onFavouriteIconTap;

  const BreedImagesScreenContent(this.state, this.onFavouriteIconTap, {super.key});

  @override
  State<BreedImagesScreenContent> createState() =>
      BreedImagesScreenContentState();
}

class BreedImagesScreenContentState extends State<BreedImagesScreenContent> {
  @override
  Widget build(BuildContext context) {
    switch (widget.state.runtimeType) {
      case Loading:
        return Center(child: CircularProgressIndicator());
      case Content:
        return BreedImagesListView(
          context,
          (widget.state as Content).breedImages,
          (item) => {
            widget.onFavouriteIconTap(item),
          }
        );
      case Error:
        return Center(
          child: Text("Error occurred:\n${(widget.state as Error).message}"),
        );
      default:
        return Center(child: Text("Unknown state"));
    }
  }
}
