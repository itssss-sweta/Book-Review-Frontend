import 'package:book_review/src/core/route/routes_name.dart';
import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/account/domain/models/my_list_model.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final StatusModel? bookStatus;
  final IconButton trailingIcon;
  const BookCard(
      {super.key,
      required this.book,
      this.bookStatus,
      required this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.detail, arguments: book);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.cardColor),
        ),
        color: AppColors.cardColor,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  book.imageUrl ?? '',
                  width: 80,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book.author ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    if (bookStatus != null)
                      _getStatusBadge(bookStatus?.status ?? '')
                  ],
                ),
              ),
              trailingIcon,
            ],
          ),
        ),
      ),
    );
  }

  Widget _getStatusBadge(String status) {
    Color badgeColor;
    String statusText;

    switch (status) {
      case 'Reading':
        badgeColor = AppColors.secondaryColor;
        statusText = 'Reading';
        break;
      case 'Completed':
        badgeColor = AppColors.successColor;
        statusText = 'Completed';
        break;
      case 'Plan to Read':
        badgeColor = AppColors.primaryColor;
        statusText = 'Plan To Read';
        break;
      case 'Dropped':
        badgeColor = AppColors.droppedColor;
        statusText = 'Dropped';
        break;
      case 'On Hold':
        badgeColor = AppColors.onHoldColor;
        statusText = 'On Hold';
        break;
      default:
        badgeColor = AppColors.cardColor;
        statusText = 'Unknown';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        statusText,
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
