import 'package:book_review/src/core/route/routes_name.dart';
import 'package:book_review/src/core/utils/constant/ui_texts.dart';
import 'package:book_review/src/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:book_review/src/features/splash/presentation/bloc/splash_event.dart';
import 'package:book_review/src/features/splash/presentation/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(CheckLoginEvent()),
      child: Scaffold(
        body: Center(
          child: BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              if (state is SplashAuthenticated) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutesName.home,
                  (route) => false,
                );
              } else if (state is SplashUnauthenticated) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutesName.welcome,
                  (route) => false,
                );
              }
            },
            child: Center(
              child: Image.asset(UiTexts.logo),
            ),
          ),
        ),
      ),
    );
  }
}
