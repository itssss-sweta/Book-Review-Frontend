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
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ((bookList!.books?.length ?? 0) >= 10)
            ? 10
            : bookList!.books?.length,
        itemBuilder: (context, index) {
          final book = bookList?.books?[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              width: 145,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    book?.imageUrl ?? '',
                    height: 180,
                    width: 130,
                    fit: BoxFit.cover,
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
            ),
          );
        },
      ),
    );
  }
}
