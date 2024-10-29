import 'package:book_review/src/core/route/routes_name.dart';
import 'package:book_review/src/features/authentication/presentation/pages/login_page.dart';
import 'package:book_review/src/features/authentication/presentation/pages/register_page.dart';
import 'package:book_review/src/features/authentication/presentation/pages/welcome_page.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/presentation/pages/detail_page.dart';
import 'package:book_review/src/features/homepage/presentation/pages/homepage.dart';
import 'package:book_review/src/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class RouterClass {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RoutesName.welcome:
        return MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case RoutesName.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        );
      case RoutesName.detail:
        return MaterialPageRoute(
          builder: (context) => DetailPage(
            book: args as Book,
          ),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}
