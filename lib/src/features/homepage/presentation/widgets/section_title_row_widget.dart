import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

/// A widget that displays a section title and an optional "View All" button.
class SectionTitleRowWidget extends StatelessWidget {
  /// Text displayed as the section title.
  final String title;

  /// Callback function for the "View All" button.
  final void Function()? onPressed;
  const SectionTitleRowWidget({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      AppColors.cardColor.withOpacity(0.5)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))),
              onPressed: onPressed,
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.labelMedium,
              )),
        ],
      ),
    );
  }
}
