import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../core/extensions/spacing.dart';

// ignore: must_be_immutable
class NextPageErrorWidget extends StatelessWidget {
  final PagingController pagingController;
  final String? message;

  const NextPageErrorWidget({
    super.key,
    required this.pagingController,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pagingController.retryLastFailedRequest,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message ?? 'Something went wrong. Tap to try again.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.grey,
                    ),
              ),
              const VSpace(4),
              const Icon(
                Icons.refresh,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
