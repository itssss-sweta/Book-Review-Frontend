import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/book_card_widget.dart';
import 'package:flutter/material.dart';

class BookListViewWidget extends StatelessWidget {
  const BookListViewWidget({
    super.key,
    required this.bookList,
  });

  final BookListModel? bookList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 345,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: ((bookList!.books?.length ?? 0) >= 10)
            ? 10
            : bookList!.books?.length,
        itemBuilder: (context, index) {
          final book = bookList?.books?[index];
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: 150,
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: BookCardWidget(book: book));
        },
      ),
    );
  }
}
