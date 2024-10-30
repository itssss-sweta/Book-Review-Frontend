import 'dart:ui';

import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/book_detail_bottom_sheet.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/detail_text_section.dart';
import 'package:book_review/src/shared/presentation/widgets/base_network_image.dart';
import 'package:book_review/src/shared/presentation/widgets/base_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookDetailAnimatedHeaderSection extends StatelessWidget {
  final Book book;
  const BookDetailAnimatedHeaderSection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BaseNetworkImage(
          imageUrl: book.imageUrl ?? '',
          height: MediaQuery.sizeOf(context).height / 2.5,
          width: double.infinity,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Container(
            color: Colors.transparent,
            height: MediaQuery.of(context).size.height / 1.7,
            width: double.infinity,
          ),
        ),
        Positioned(
          top: 50 + MediaQuery.paddingOf(context).top,
          left: 0,
          right: 0,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: BaseNetworkImage(
                      imageUrl: book.imageUrl,
                      boxFit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 24.0, left: 8.0, right: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          book.title ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                            shadows: [
                              Shadow(
                                blurRadius: 4,
                                color: AppColors.secondaryTextColor
                                    .withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          book.author ?? '',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.secondaryTextColor,
                            shadows: [
                              Shadow(
                                blurRadius: 2,
                                color: AppColors.secondaryTextColor
                                    .withOpacity(0.2),
                              ),
                            ],
                          ),
                        ),
                        RatingBarIndicator(
                          rating: book.rating ?? 0,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: AppColors.accentColor,
                          ),
                          itemCount: 5,
                          itemSize: 18.0,
                        ),
                        Text(book.rating.toString()),
                        Text(
                          'Publication Year',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(book.publicationYear.toString()),
                        Text(
                          'Language',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(book.language ?? ''),
                        DetailTextSection(
                          title: 'Summary',
                          content: book.description,
                        ),
                        const SizedBox(height: 12.0),
                        BasePrimaryButton(
                          buttonColor: AppColors.primaryColor.withOpacity(0.8),
                          buttonWidth: MediaQuery.sizeOf(context).width / 3,
                          buttonHeight: 40,
                          onPressed: () => _showBottomSheet(context, book),
                          borderRadius: 8.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add,
                                  color: AppColors.backgroundColor, size: 14),
                              const SizedBox(width: 4.0),
                              Text(
                                'Add to List',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: AppColors.backgroundColor,
                                        fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 40 + MediaQuery.paddingOf(context).top,
          left: 0,
          right: 0,
          child: _buildBookHeaderAction(context),
        ),
      ],
    );
  }
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

Widget _buildBookHeaderAction(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIcon(
          context,
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => Navigator.of(context).pop(),
        ),
        _buildIcon(context, icon: Icons.bookmark, onTap: () {}),
      ],
    ),
  );
}

Widget _buildIcon(BuildContext context,
    {required IconData icon, required VoidCallback onTap}) {
  return CircleAvatar(
    radius: 20,
    backgroundColor: AppColors.backgroundColor.withOpacity(0.3),
    child: IconButton(
      onPressed: onTap,
      icon: Icon(icon, color: AppColors.backgroundColor),
    ),
  );
}
