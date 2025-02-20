import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/locator.dart';
import '../viewmodel/BreedImagesViewModel.dart';
import 'BreedImagesScreenContent.dart';

class BreedImagesScreen extends StatefulWidget {
  final String? breedName;

  const BreedImagesScreen(this.breedName, {super.key});

  @override
  State<BreedImagesScreen> createState() => HomeViewState();
}

class HomeViewState extends State<BreedImagesScreen> {
  final BreedImagesViewModel viewModel = getIt.get<BreedImagesViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.init(widget.breedName);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BreedImagesViewModel>.value(
      value: viewModel,
      child: Consumer<BreedImagesViewModel>(
        builder: (context, userViewModel, child) {
          return Scaffold(
            appBar: AppBar(title: Center(child: Text("Images of ${widget.breedName}"))),
            body: BreedImagesScreenContent(viewModel.state, (item) => {
              viewModel.onFavouriteIconTap(item),
            }),
          );
        },
      ),
    );
  }
}
