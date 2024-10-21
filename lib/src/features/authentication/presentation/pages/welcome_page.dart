import 'package:book_review/src/core/route/routes_name.dart';
import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/authentication/presentation/widgets/bottom_clipper.dart';
import 'package:book_review/src/shared/presentation/widgets/base_primary_button.dart';
import 'package:flutter/material.dart';

/// WelcomePage is a stateless widget that represents the main welcome screen of the app.
class WelcomePage extends StatelessWidget {
  /// A stateless widget that represents the main welcome screen of the app.
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: BottomWaveClipper(),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/welcome_logo.jpg',
                  height: MediaQuery.sizeOf(context).height / 2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height / 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.backgroundColor.withOpacity(0.0),
                        AppColors.backgroundColor.withOpacity(0.0),
                        AppColors.backgroundColor.withOpacity(0.0),
                        AppColors.backgroundColor.withOpacity(0.0),
                        AppColors.backgroundColor.withOpacity(0.0),
                        AppColors.backgroundColor.withOpacity(0.0),
                        AppColors.backgroundColor.withOpacity(0.0),
                        AppColors.backgroundColor.withOpacity(0.1),
                        AppColors.backgroundColor.withOpacity(0.25),
                        AppColors.backgroundColor.withOpacity(0.5),
                        AppColors.backgroundColor.withOpacity(0.75),
                        AppColors.backgroundColor.withOpacity(1.0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 28),
                RichText(
                  text: TextSpan(
                    text: 'Welcome to ',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 24),
                    children: [
                      TextSpan(
                        text: 'ReviewBook 👋',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                color: AppColors.secondaryColor, fontSize: 24),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Discover, Review, Connect – For the Love of Books.',
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                BasePrimaryButton(
                  label: 'Get Started',
                  onPressed: () {
                    Navigator.of(context).pushNamed(RoutesName.register);
                  },
                ),
                const SizedBox(height: 12),
                BasePrimaryButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RoutesName.login);
                  },
                  label: 'I Already Have an Account',
                  buttonColor: AppColors.cardColor,
                  textColor: AppColors.primaryTextColor,
                  borderColor: AppColors.secondaryTextColor.withOpacity(0.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
