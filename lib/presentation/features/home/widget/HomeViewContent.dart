import 'package:flutter/material.dart';

import '../HomeViewUiState.dart';
import 'BreedsListView.dart';

class HomeViewContent extends StatefulWidget {
  final HomeViewUiState state;

  const HomeViewContent(this.state, {super.key});

  @override
  State<HomeViewContent> createState() => HomeViewContentState();
}

class HomeViewContentState extends State<HomeViewContent> {
  @override
  Widget build(BuildContext context) {
    switch (widget.state.runtimeType) {
      case Loading:
        return Center(child: CircularProgressIndicator());
      case Content:
        return BreedsListView(context, (widget.state as Content).breedList);
      case Error:
        return Center(
          child: Text("Error occurred: ${(widget.state as Error).message}"),
        );
      default:
        return Center(child: Text("Unknown state"));
    }
  }
}
