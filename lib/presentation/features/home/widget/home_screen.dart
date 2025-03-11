import 'package:flashcards_flutter/core/localization/generated/l10n.dart';
import 'package:flashcards_flutter/core/presentation/constant_components.dart';
import 'package:flashcards_flutter/core/presentation/error_view.dart';
import 'package:flashcards_flutter/presentation/features/home/home_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/locator.dart';
import '../cubit/home_cubit.dart';
import 'breeds_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final _l10n = getIt<I10n>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<HomeCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(_l10n.home_title)),
        ),
        body: BlocBuilder<HomeCubit, HomeScreenState>(
          builder: (context, state) {
            switch (state) {
              case Loading():
                return loadingView;
              case Content():
                return breedsView(context, state.breedList);
              case Error():
                return ErrorView(state.type.toMessage());
            }
          },
        ),
      ),
    );
  }
}
