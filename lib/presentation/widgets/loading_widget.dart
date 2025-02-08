import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
