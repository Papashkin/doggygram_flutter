import 'package:flashcards_flutter/core/presentation/constant_components.dart';
import 'package:flashcards_flutter/presentation/features/about/about_state.dart';
import 'package:flashcards_flutter/presentation/features/about/cubit/about_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/localization/generated/l10n.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static final _l10n = getIt<I10n>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<AboutCubit>(),
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text(_l10n.app_name))),
        body: BlocBuilder<AboutCubit, AboutState>(
          builder: (context, state) {
            switch (state) {
              case Loading():
                return loadingView;
              case Content():
                return contentAbout(
                  context,
                  _l10n.about_description,
                  state.version,
                );
            }
          },
        ),
      ),
    );
  }
}

Widget contentAbout(BuildContext context, String description, String? version) {
  return Scaffold(
    body: Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/app_icon.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Text(
            version ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    ),
  );
}
