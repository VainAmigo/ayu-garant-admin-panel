import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:flutter/material.dart';

@immutable
final class AppRouter {
  const AppRouter._();

  static const main = '/main';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      main => MaterialPageRoute(
          settings: const RouteSettings(name: main),
          builder: (_) => const AppMainView(),
        ),
      _ => throw Exception('No builder specified for route named: [${settings.name}]'),
    };
  }
}
