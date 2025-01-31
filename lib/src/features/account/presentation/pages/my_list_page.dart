import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/core/utils/show_snackbar.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_event.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_state.dart';
import 'package:book_review/src/shared/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: while using api, take the book list from AccountBloc
    final myListBooks = context.read<HomePageBloc>().myListBooks;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My List',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: BlocListener<HomePageBloc, HomePageState>(
        listener: (context, state) {
          if (state.myListDeletedMessage != null) {
            ShowSnackbar.showSnackBar(context,
                title: state.myListDeletedMessage!,
                backgroundColor: AppColors.droppedColor);
          }
        },
        child:
            BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: myListBooks.isEmpty
                ? const Center(
                    child: Text('No Book Found in My List'),
                  )
                : ListView.builder(
                    itemCount: myListBooks.length,
                    itemBuilder: (context, index) {
                      final book = myListBooks[index];
                      final bookDetail = book.book;
                      return BookCard(
                        book: bookDetail ?? Book(),
                        bookStatus: book.bookStatus,
                        trailingIcon: IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          color: AppColors.errorColor,
                          onPressed: () {
                            context.read<HomePageBloc>().add(
                                RemoveFromListEvent(
                                    book: bookDetail ?? Book()));
                          },
                        ),
                      );
                    },
                  ),
          );
        }),
      ),
    );
  }
}
