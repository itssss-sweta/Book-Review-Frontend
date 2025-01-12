import 'package:book_review/src/core/route/routes_name.dart';
import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/core/utils/constant/ui_texts.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/bottom_nav_bloc.dart';
import 'package:book_review/src/features/account/presentation/pages/account_page.dart';
import 'package:book_review/src/features/homepage/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                UiTexts.logo,
                width: 60,
                height: 60,
              ),
              Text(
                'Shelf Speak',
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          ),
          scrolledUnderElevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutesName.favourite);
                },
                icon: const Icon(Icons.favorite)),
          ],
        ),
        body: BlocBuilder<BottomNavBloc, int>(
          builder: (context, currentIndex) {
            switch (currentIndex) {
              case 0:
                return const HomePage();
              case 1:
                return const Center(child: Text("Search Screen"));
              case 2:
                return const Center(child: Text("Notifications Screen"));
              case 3:
                return const AccountPage();
              default:
                return const Center(child: Text("Unknown Screen"));
            }
          },
        ),
        bottomNavigationBar:
            BlocBuilder<BottomNavBloc, int>(builder: (context, currentIndex) {
          return BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                switch (index) {
                  case 0:
                    context.read<BottomNavBloc>().add(BottomNavEvent.home);
                    break;
                  case 1:
                    context.read<BottomNavBloc>().add(BottomNavEvent.search);
                    break;
                  case 2:
                    context
                        .read<BottomNavBloc>()
                        .add(BottomNavEvent.notifications);
                    break;
                  case 3:
                    context.read<BottomNavBloc>().add(BottomNavEvent.account);
                    break;
                }
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              useLegacyColorScheme: false,
              unselectedItemColor: AppColors.secondaryTextColor,
              selectedItemColor: AppColors.accentColor,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: 'Notification'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Account'),
              ]);
        }),
      ),
    );
  }
}
