import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/core/utils/constant/ui_texts.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// CustomLoaderWidget is widget that displays a loading animation
/// along with a title message.
class CustomLoaderWidget extends StatelessWidget {
  /// The title that will be displayed under the loading animation.
  final String loadingTitle;

  /// Constructor for the CustomLoaderWidget.
  ///
  /// The [loadingTitle] is required to provide a description of the task in progress.
  const CustomLoaderWidget({
    super.key,
    required this.loadingTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 44, vertical: 44),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.white,
          ),
          child: Column(
            children: [
              LottieBuilder.asset(
                UiTexts.bookAnimationJson,
                height: 100,
              ),
              Text(
                loadingTitle,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
