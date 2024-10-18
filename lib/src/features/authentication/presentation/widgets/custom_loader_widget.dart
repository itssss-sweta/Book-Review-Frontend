import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoaderWidget extends StatelessWidget {
  final String loadingTitle;
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
                'assets/json/book-animation.json',
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
