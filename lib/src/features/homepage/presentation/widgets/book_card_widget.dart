import 'package:book_review/src/core/route/routes_name.dart';
import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/shared/presentation/widgets/base_network_image.dart';
import 'package:flutter/material.dart';

class BookCardWidget extends StatelessWidget {
  const BookCardWidget({
    super.key,
    required this.book,
    this.height,
    this.imageHeight,
  });

  final Book? book;
  final double? height;
  final double? imageHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RoutesName.detail, arguments: book);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.cardColor.withOpacity(0.5)),
            ),
            clipBehavior: Clip.antiAlias,
            child: LayoutBuilder(builder: (context, constraints) {
              return BaseNetworkImage(
                imageUrl: book?.imageUrl ?? '',
                height: constraints.maxWidth * (imageHeight ?? 1.5),
                width: constraints.maxWidth,
              );
            }),
          ),
          const SizedBox(
            height: 4,
          ),
          LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxWidth * (height ?? 0.69),
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
