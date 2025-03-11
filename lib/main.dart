import 'package:flashcards_flutter/core/presentation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/di/locator.dart';
import 'core/localization/generated/l10n.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
        I10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: I10n.delegate.supportedLocales,
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (supportedLocales
            .map((e) => e.languageCode)
            .contains(deviceLocale?.languageCode)) {
          return deviceLocale;
        } else {
          return const Locale('en', '');
        }
      },
      title: 'DoggyGram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
      ),
      routerConfig: mainRouter,
    );
  }
}
