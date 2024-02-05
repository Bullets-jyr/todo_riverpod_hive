import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme_state.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  ThemeState build() {
    return const LightTheme();
  }

  void toggleTheme() {
    state = switch (state) {
      LightTheme() => const DarkTheme(),
      DarkTheme() => const LightTheme(),
    };
  }
}