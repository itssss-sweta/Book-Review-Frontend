import 'dart:ui';

import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/shared/presentation/widgets/base_network_image.dart';
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
            children: [
              Stack(
                children: [
                  BaseNetworkImage(
                    imageUrl: book.imageUrl ?? '',
                    height: MediaQuery.sizeOf(context).height / 2.2,
                    width: double.infinity,
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 12),
                    child: Container(
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height / 2.2,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor:
                              AppColors.backgroundColor.withOpacity(0.3),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: AppColors.backgroundColor,
                              )),
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor:
                              AppColors.backgroundColor.withOpacity(0.3),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.bookmark,
                                color: AppColors.backgroundColor,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: BaseNetworkImage(
                          imageUrl: book.imageUrl ?? '',
                          boxFit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                book.title ?? '',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: AppColors.secondaryTextColor.withOpacity(0.5),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 5,
              ),
              const SizedBox(height: 4),
              Text(
                book.author ?? '',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.secondaryTextColor,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: AppColors.secondaryTextColor.withOpacity(0.2),
                    ),
                  ],
                ),
                textAlign: TextAlign.center, // Center text
                softWrap: true,
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
