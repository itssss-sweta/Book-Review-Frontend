import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/detail_action_header.dart';
import 'package:book_review/src/features/homepage/presentation/widgets/detail_image_background.dart';
import 'package:book_review/src/shared/presentation/widgets/base_network_image.dart';
import 'package:flutter/material.dart';

class BookDetailHeaderSection extends StatelessWidget {
  final Book book;
  const BookDetailHeaderSection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DetailImageBackground(imageUrl: book.imageUrl ?? ''),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: _buildCenteredBookImage(imageUrl: book.imageUrl ?? ''),
          ),
        ),
        const BookActionHeader(),
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
