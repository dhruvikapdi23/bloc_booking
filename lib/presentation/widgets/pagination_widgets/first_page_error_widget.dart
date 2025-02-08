import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../core/extensions/spacing.dart';

// ignore: must_be_immutable
class FirstPageErrorWidget extends StatelessWidget {
  final String? title;
  final String? message;
  final PagingController pagingController;
  final VoidCallback? onTap;

  const FirstPageErrorWidget({
    super.key,
    this.title,
    this.message,
    required this.pagingController,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Image.asset(ImageAssets.warning),
          const VSpace(10),
          Text(
            title ?? 'Something went wrong',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const VSpace(10),
          Text(
            message ?? 'The application has encountered an unknown error. Please try again later.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),
          ),
          const VSpace(18),
          FilledButton(
            onPressed: onTap ?? pagingController.retryLastFailedRequest,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
