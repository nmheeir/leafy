import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key, required this.heroTag});
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('data')));
  }
}
