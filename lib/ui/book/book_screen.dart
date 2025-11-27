import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy/router/routes.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key, required this.heroTag});
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => context.go(Routes.home),
      child: Scaffold(body: Center(child: Text('data'))),
    );
  }
}
