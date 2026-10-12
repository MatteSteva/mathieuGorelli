import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'l10n/app_controller.dart';
import 'router.dart';
import 'theme/app_theme.dart';

void main() {
  // URL puliti senza '#': dominio.it/contatti invece di dominio.it/#/contatti.
  usePathUrlStrategy();
  runApp(const MathieuPortfolioApp());
}

class MathieuPortfolioApp extends StatefulWidget {
  const MathieuPortfolioApp({super.key});
  @override
  State<MathieuPortfolioApp> createState() => _MathieuPortfolioAppState();
}

class _MathieuPortfolioAppState extends State<MathieuPortfolioApp> {
  final AppController _controller = AppController();
  late final _router = createRouter();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScope(
      controller: _controller,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return MaterialApp.router(
            title: 'Mathieu Gorelli — Portfolio',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.build(),
            locale: _controller.locale,
            supportedLocales: const [Locale('it'), Locale('en')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routerConfig: _router,
          );
        },
      ),
    );
  }
}
