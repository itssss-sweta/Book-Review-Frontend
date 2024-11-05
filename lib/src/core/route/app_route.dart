import 'package:book_review/src/core/route/routes_name.dart';
import 'package:book_review/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:book_review/src/features/authentication/presentation/pages/login_page.dart';
import 'package:book_review/src/features/authentication/presentation/pages/register_page.dart';
import 'package:book_review/src/features/authentication/presentation/pages/welcome_page.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:book_review/src/features/homepage/presentation/pages/detail_page.dart';
import 'package:book_review/src/features/homepage/presentation/pages/homepage.dart';
import 'package:book_review/src/features/homepage/presentation/pages/view_all_page.dart';
import 'package:book_review/src/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          builder: (_) => BlocProvider(
            create: (_) => AuthBloc(),
            child: const LoginPage(),
          ),
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
          builder: (_) => BlocProvider(
            create: (_) => HomePageBloc(),
            child: const HomePage(),
          ),
        );
      case RoutesName.viewAll:
        final args = settings.arguments as Map<String, dynamic>;
        final title = args['title'] as String;
        final bookList = args['bookList'] as BookListModel;

        return MaterialPageRoute(
          builder: (context) => ViewAllPage(
            title: title,
            bookList: bookList,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}
