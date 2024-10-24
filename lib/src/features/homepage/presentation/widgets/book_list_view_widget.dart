import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
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
      height: 340,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ((bookList!.books?.length ?? 0) >= 10)
              ? 10
              : bookList!.books?.length,
          itemBuilder: (context, index) {
            final book = bookList?.books?[index];
            return BookCardWidget(book: book);
          },
        ),
      ),
    );
  }
}

class BookCardWidget extends StatelessWidget {
  const BookCardWidget({
    super.key,
    required this.book,
  });

  final Book? book;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 160,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: AppColors.secondaryTextColor.withOpacity(0.5)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              book?.imageUrl ?? '',
              height: 175,
              width: 145,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxWidth * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book?.genre ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: AppColors.secondaryTextColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    book?.title ?? 'No Title',
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  Text(
                    book?.author ?? 'Unknown Author',
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ],
              ),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: AppColors.accentColor,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text((book?.rating ?? 0.0).toString()),
                ],
              ),
              IconButton(
                iconSize: 25,
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_outline,
                  size: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
