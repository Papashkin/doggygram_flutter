import 'package:flashcards_flutter/core/ui/di/locator.dart';
import 'package:flashcards_flutter/core/ui/home/viewmodel/HomeViewModel.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final viewModel = getIt.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(viewModel.title),
            Text(viewModel.description),
          ],
        ),
      ),
    );
  }
}
