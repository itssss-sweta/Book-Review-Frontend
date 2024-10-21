import 'package:book_review/src/core/route/routes_name.dart';
import 'package:book_review/src/core/utils/loading_dialog.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_event.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  context.read<HomepPageBloc>().add(LogoutEvent());
                },
                icon: const Icon(Icons.logout)),
          ],
        ),
        body: BlocListener<HomepPageBloc, HomePageState>(
          listener: (context, state) {
            if (state is HomePageLoading) {
              const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LogoutLoading) {
              LoadingDialog.showLoadingDialog(context,
                  loadingTitle: 'Logging out...');
            } else if (state is LogoutSuccessful) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RoutesName.login,
                (route) => false,
              );
            }
          },
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: const Text('Book1'),
                subtitle: const Text('Nice book'),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
              );
            },
          ),
        ));
  }
}
