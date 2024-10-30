import 'dart:ui';

import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/shared/presentation/widgets/base_network_image.dart';
import 'package:flutter/material.dart';

class BookDetailHeaderSection extends StatelessWidget {
  final Book book;
  const BookDetailHeaderSection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: _buildCenteredBookImage(imageUrl: book.imageUrl ?? ''),
          ),
        ),
        _buildBookHeaderAction(context),
      ],
    );
  }
}

Widget _buildCenteredBookImage({required String imageUrl}) {
  return Container(
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
    ),
    clipBehavior: Clip.antiAlias,
    child: BaseNetworkImage(
      imageUrl: imageUrl,
      boxFit: BoxFit.fitHeight,
    ),
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
