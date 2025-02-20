import 'package:flutter/material.dart';
import '../BreedImagesUiState.dart';

class BreedImagesScreenContent extends StatefulWidget {
  final BreedImagesUiState state;

  const BreedImagesScreenContent(this.state, {super.key});

  @override
  State<BreedImagesScreenContent> createState() =>
      BreedImagesScreenContentState();
}

class BreedImagesScreenContentState extends State<BreedImagesScreenContent> {
  @override
  Widget build(BuildContext context) {
    switch (widget.state.runtimeType) {
      case Loading _:
        return Center(child: CircularProgressIndicator());
      case Content _:
        return Center(
          child: Text("Images of selected breed\nwill be displayed here"),
        );
      case Error _:
        return Center(
          child: Text("Error occurred: ${(widget.state as Error).message}"),
        );
      default:
        return Center(child: Text("Unknown state"));
    }
  }
}
