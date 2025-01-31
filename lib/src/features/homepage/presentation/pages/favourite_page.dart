import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:book_review/src/shared/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final books = context.read<HomePageBloc>().favouriteBooks;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Books',
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: books.isEmpty
            ? const Center(
                child: Text('No Favourite Book'),
              )
            : ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return BookCard(
                    book: books[index],
                    trailingIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: AppColors.accentColor,
                        )),
                  );
                },
              ),
      ),
    );
  }
}
