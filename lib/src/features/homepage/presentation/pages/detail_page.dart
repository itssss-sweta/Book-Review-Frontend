import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/attribute_card.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/book_detail_bottom_sheet.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/book_detail_header_section.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/detail_text_section.dart';
import 'package:book_review/src/shared/presentation/widgets/base_primary_button.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookDetailHeaderSection(book: book),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12.0),
                    _buildBookTitleAuthorSection(context, book),
                    const SizedBox(height: 12.0),
                    _buildAttributeCardRow(book),
                    const SizedBox(height: 12.0),
                    DetailTextSection(
                        title: 'Summary', content: book.description),
                    const SizedBox(height: 12.0),
                    DetailTextSection(title: 'Genre', content: book.genre),
                    const SizedBox(height: 12.0),
                    BasePrimaryButton(
                      buttonColor: AppColors.primaryColor.withOpacity(0.8),
                      buttonWidth: MediaQuery.sizeOf(context).width,
                      onPressed: () => _showBottomSheet(context, book),
                      borderRadius: 8.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add,
                              color: AppColors.backgroundColor, size: 18),
                          const SizedBox(width: 4.0),
                          Text(
                            'Add to List',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: AppColors.backgroundColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_buildBookTitleAuthorSection(BuildContext context, Book book) {
  return Align(
    alignment: Alignment.center,
    child: Column(
      children: [
        Text(
          book.title ?? '',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            shadows: [
              Shadow(
                  blurRadius: 4,
                  color: AppColors.secondaryTextColor.withOpacity(0.5))
            ],
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          book.author ?? '',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.secondaryTextColor,
            shadows: [
              Shadow(
                  blurRadius: 2,
                  color: AppColors.secondaryTextColor.withOpacity(0.2))
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildAttributeCardRow(Book book) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AttributeCard(
          icon: Icons.star,
          title: 'Rating',
          value: book.rating.toString(),
          iconColor: AppColors.accentColor),
      AttributeCard(
          icon: Icons.publish,
          title: 'Publication Year',
          value: book.publicationYear.toString(),
          iconColor: AppColors.primaryColor.withOpacity(0.8)),
      AttributeCard(
          icon: Icons.language,
          title: 'Language',
          value: book.language ?? '',
          iconColor: AppColors.secondaryTextColor),
    ],
  );
}

void _showBottomSheet(BuildContext context, Book book) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.0),
        topRight: Radius.circular(12.0),
      ),
    ),
    constraints: const BoxConstraints(minWidth: double.infinity),
    builder: (context) {
      return BookDetailBottomSheet(book: book);
    },
  );
}
