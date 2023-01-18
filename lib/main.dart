import 'package:flutter/material.dart';

import 'env/env_default.dart';
import 'main/main_widget.dart';
import 'theme/theme_default.dart';

void main() {
  runApp(
    MainWidget(
      theme: ThemeDefault.data,
      title: EnvDefault.appTitle,
      child: const Text(EnvDefault.appTitle),
    ),
  );
}
