import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/di/locator.dart';
import '../viewmodel/HomeViewModel.dart';
import 'HomeViewContent.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final HomeViewModel viewModel = getIt.get<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, userViewModel, child) {
          return Scaffold(
            appBar: AppBar(title: Center(child: Text("List of breeds"))),
            body: HomeViewContent(viewModel.state),
          );
        },
      ),
    );
  }
}

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), duration: Duration(seconds: 2)),
  );
}
