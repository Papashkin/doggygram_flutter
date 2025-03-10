import 'package:flashcards_flutter/core/presentation/constant_components.dart';
import 'package:flashcards_flutter/presentation/features/breedimages/cubit/breed_images_cubit.dart';
import 'package:flashcards_flutter/presentation/features/breedimages/widget/breed_images_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/presentation/error_view.dart';
import '../breed_images_state.dart';

class BreedImagesScreen extends StatefulWidget {
  final String? breedName;

  const BreedImagesScreen(this.breedName, {super.key});

  @override
  State<BreedImagesScreen> createState() => _BreedImagesScreenState();
}

class _BreedImagesScreenState extends State<BreedImagesScreen> {
  final BreedImagesCubit _cubit = getIt.get<BreedImagesCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.init(widget.breedName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Images of ${widget.breedName}")),
      ),
      body: Center(
        child: BlocBuilder<BreedImagesCubit, BreedImagesState>(
          bloc: _cubit,
          builder: (context, state) {
            switch (state) {
              case Loading():
                return loadingView;
              case Content():
                return breedImagesGrid(
                  context,
                  state.breedImages,
                  (item) => {_cubit.onFavouriteIconTap(item)},
                );
              case Error():
                return ErrorView(state.type);
            }
          },
        ),
      ),
    );
  }
}
