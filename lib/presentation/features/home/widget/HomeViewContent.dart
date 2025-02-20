import 'package:flutter/material.dart';
import '../HomeViewUiState.dart';
import 'HomeView.dart';

class HomeViewContent extends StatefulWidget {
  final HomeViewUiState state;

  HomeViewContent(this.state);

  @override
  State<HomeViewContent> createState() => HomeViewContentState();
}

class HomeViewContentState extends State<HomeViewContent> {
  @override
  Widget build(BuildContext context) {
    if (widget.state.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: widget.state.breedList.length,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final breed = widget.state.breedList[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(
              vertical: 2.0,
              horizontal: 2.0,
            ),
            tileColor: (index%2 == 0) ? Colors.white : Colors.grey[50],
            title: Text(breed.breed),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16),
            leading: Icon(Icons.pets_rounded, size: 40),
            subtitle:
            breed.subBreed.isEmpty
                ? null
                : Text(
              breed.subBreeds,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap:
                () => {
              //TODO fix navigation to breeds images next time
              showSnackbar(context, 'you clicked on ${breed.breed}'),
            },
          );
        },
      );
    }
  }
}