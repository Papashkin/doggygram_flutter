import 'package:flashcards_flutter/core/ui/di/locator.dart';
import 'package:flashcards_flutter/core/ui/home/viewmodel/HomeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../HomeViewUiState.dart';

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

class HomeViewContent extends StatefulWidget {
  final HomeViewUiState state;

  HomeViewContent(this.state);

  @override
  State<HomeViewContent> createState() => HomeViewContentState();
}

class HomeViewContentState extends State<HomeViewContent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.state.breedList.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final breed = widget.state.breedList[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
          title: Text(breed.breed),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          leading: Icon(Icons.pets_rounded),
          subtitle:
              breed.subBreed.isEmpty
                  ? null
                  : Text(
                    breed.subBreeds,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
          onTap: () => {
            //TODO fix navigation to breeds images next time
            showSnackbar(context, 'you clicked on ${breed.breed}'),
          },
        );
      },
    );
  }
}

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ),
  );
}