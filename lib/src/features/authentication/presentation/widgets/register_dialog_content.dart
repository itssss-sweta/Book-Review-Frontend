import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterDialogContent extends StatelessWidget {
  const RegisterDialogContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.secondaryColor.withOpacity(0.8),
          radius: 50,
          child: const Icon(
            Icons.person,
            color: AppColors.backgroundColor,
            size: 50,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Sign Up Successful',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppColors.secondaryColor,
                fontSize: 24,
              ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Your account has been created. Please wait a moment, we are preparing for you.',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 32,
        ),
        LoadingAnimationWidget.hexagonDots(
            color: AppColors.secondaryColor, size: 50),
      ],
    );
  }
}
