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
    return BlocProvider(
      create: (context) => HomePageBloc()..add(BookListFetchEvent()),
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<HomePageBloc>().add(LogoutEvent());
                  },
                  icon: const Icon(Icons.logout)),
            ],
          ),
          body: BlocListener<HomePageBloc, HomePageState>(
            listener: (context, state) {
              if (state is BookListLoading) {
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
            child: BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
                if (state is BookListLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is BookListLoaded) {
                  final bookList = state.bookListModel;
                  return ListView.builder(
                    itemCount: bookList.books?.length,
                    itemBuilder: (context, index) {
                      final book = bookList.books?[index];
                      return ListTile(
                        title: Text(book?.title ?? ''),
                        subtitle: Text(book?.author ?? ''),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite),
                        ),
                      );
                    },
                  );
                } else if (state is BookListError) {
                  return Center(
                    child: Text('Failed to load books: ${state.error}'),
                  );
                }
                return const SizedBox();
              },
            ),
          )),
    );
  }
}
