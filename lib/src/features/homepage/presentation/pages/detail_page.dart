import 'dart:ui';

import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/attribute_card.dart';
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      book.title ?? '',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color:
                                AppColors.secondaryTextColor.withOpacity(0.5),
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
                            color:
                                AppColors.secondaryTextColor.withOpacity(0.2),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AttributeCard(
                          icon: Icons.star,
                          title: 'Rating',
                          value: book.rating.toString(),
                          iconColor: AppColors.accentColor,
                        ),
                        AttributeCard(
                          icon: Icons.publish,
                          title: 'Publication Year',
                          value: book.publicationYear.toString(),
                          iconColor: AppColors.primaryColor.withOpacity(0.8),
                        ),
                        AttributeCard(
                          icon: Icons.language,
                          title: 'Language',
                          value: book.language ?? '',
                          iconColor: AppColors.secondaryTextColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Summary',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontSize: 20),
                      ),
                    ),
                    Text(
                      book.description ?? "",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: FittedBox(
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.add,
                                    color: AppColors.backgroundColor,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    'Add to List',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                            color: AppColors.backgroundColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const DropdownMenu(
                            hintText: 'Select',
                            trailingIcon: Icon(
                              Icons.star,
                              color: AppColors.accentColor,
                            ),
                            width: 130,
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                  label: '(5) Excellent', value: '5'),
                              DropdownMenuEntry(
                                  label: '(4) Very Good', value: '4'),
                              DropdownMenuEntry(label: '(3) Good', value: '3'),
                              DropdownMenuEntry(
                                  label: '(2) Average', value: '2'),
                              DropdownMenuEntry(label: '(1) Bad', value: '1'),
                            ]),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              hintText: '0',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Align(
                                    alignment: Alignment.center,
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Text(
                                      'Pages',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    )),
                              ),
                              suffixIcon: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1.0,
                                  heightFactor: 1.0,
                                  child: Text(
                                    '/${book.pageCount}',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  )),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: AppColors.secondaryTextColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: AppColors.secondaryTextColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
