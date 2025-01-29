import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/core/utils/show_snackbar.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_event.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                    child: Text('No Book Found in MyList'),
                  )
                : ListView.builder(
                    itemCount: myListBooks.length,
                    itemBuilder: (context, index) {
                      final book = myListBooks[index];
                      final bookDetail = book.book;
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                              color: AppColors.cardColor, width: 1),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16.0),
                          leading: CachedNetworkImage(
                            imageUrl: bookDetail?.imageUrl ?? '',
                            height: 100,
                          ),
                          title: Text(
                            bookDetail?.title ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.primaryTextColor,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              _getStatusBadge(book.bookStatus?.status ?? ''),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            color: AppColors.errorColor,
                            onPressed: () {
                              context.read<HomePageBloc>().add(
                                  RemoveFromListEvent(
                                      book: book.book ?? Book()));
                            },
                          ),
                        ),
                      );
                    },
                  ),
          );
        }),
      ),
    );
  }

  Widget _getStatusBadge(String status) {
    Color badgeColor;
    String statusText;

    switch (status) {
      case 'Reading':
        badgeColor = AppColors.secondaryColor;
        statusText = 'Reading';
        break;
      case 'Completed':
        badgeColor = AppColors.successColor;
        statusText = 'Completed';
        break;
      case 'Plan to Read':
        badgeColor = AppColors.primaryColor;
        statusText = 'Plan To Read';
        break;
      case 'Dropped':
        badgeColor = AppColors.droppedColor;
        statusText = 'Dropped';
        break;
      case 'On Hold':
        badgeColor = AppColors.onHoldColor;
        statusText = 'On Hold';
        break;
      default:
        badgeColor = AppColors.cardColor;
        statusText = 'Unknown';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        statusText,
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
