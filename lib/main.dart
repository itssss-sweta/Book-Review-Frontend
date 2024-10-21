import 'package:book_review/src/core/route/app_route.dart';
import 'package:book_review/src/core/route/routes_name.dart';
import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:book_review/src/shared/data/data_source/local/cache_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheServices.getCacheServicesInstance.initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
          BlocProvider(
            create: (context) => HomepPageBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.backgroundColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.backgroundColor,
            ),
            textTheme: const TextTheme(
              headlineLarge: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
              headlineMedium: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              headlineSmall: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              titleLarge: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              titleMedium: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              titleSmall: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              labelLarge: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              labelMedium: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              labelSmall: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              bodyLarge: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              bodyMedium: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              bodySmall: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ),
          onGenerateRoute: RouterClass.generateRoute,
          initialRoute: RoutesName.splash,
        ));
  }
}
