import 'package:flutter/material.dart';

/// Gestisce la lingua corrente del sito (IT / EN).
class AppController extends ChangeNotifier {
  Locale _locale = const Locale('it');
  Locale get locale => _locale;
  bool get isItalian => _locale.languageCode == 'it';

  void setLocale(Locale value) {
    if (value == _locale) return;
    _locale = value;
    notifyListeners();
  }

  void toggle() =>
      setLocale(isItalian ? const Locale('en') : const Locale('it'));
}

/// Rende disponibile [AppController] a tutto l'albero dei widget.
class AppScope extends InheritedNotifier<AppController> {
  const AppScope({
    super.key,
    required AppController controller,
    required super.child,
  }) : super(notifier: controller);

  static AppController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppScope>();
    assert(scope != null, 'AppScope non trovato nel contesto');
    return scope!.notifier!;
  }
}
