import 'package:flutter/material.dart';

class WritingThreadScreen extends StatelessWidget {
  const WritingThreadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New thread",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
