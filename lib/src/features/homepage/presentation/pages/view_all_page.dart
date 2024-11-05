import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/book_card_widget.dart';
import 'package:flutter/material.dart';

class ViewAllPage extends StatelessWidget {
  final String title;
  final BookListModel bookList;
  const ViewAllPage({super.key, required this.title, required this.bookList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
        scrolledUnderElevation: 0,
      ),
      body: GridView.builder(
        itemCount: bookList.books?.length ?? 0,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.5,
        ),
        itemBuilder: (context, index) {
          final book = bookList.books?[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                      color: AppColors.secondaryTextColor.withOpacity(0.05))),
              shadowColor: AppColors.cardColor,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: BookCardWidget(
                  book: book,
                  height: 0.6,
                  imageHeight: 1.4,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
