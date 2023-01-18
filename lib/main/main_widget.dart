import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({
    required this.theme,
    required this.title,
    required this.child,
    super.key,
  });

  final String title;
  final ThemeData theme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: theme,
      home: child,
    );
  }
}
