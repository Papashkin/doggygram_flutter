import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/locator.dart';
import '../viewmodel/BreedImagesViewModel.dart';
import 'BreedImagesScreenContent.dart';

class BreedImagesScreen extends StatefulWidget {
  const BreedImagesScreen({super.key});

  @override
  State<BreedImagesScreen> createState() => HomeViewState();
}

class HomeViewState extends State<BreedImagesScreen> {
  final BreedImagesViewModel viewModel = getIt.get<BreedImagesViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.init("hound"); //TODO replace hardcoded name with one from navigation
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<BreedImagesViewModel>(
        builder: (context, userViewModel, child) {
          return Scaffold(
            appBar: AppBar(title: Center(child: Text("List of breeds"))),
            body: BreedImagesScreenContent(viewModel.state),
          );
        },
      ),
    );
  }
}
