import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatefulWidget {
  final String reviewerName;
  final String profileImageUrl;
  final double rating;
  final String reviewText;
  final String reviewDate;

  const ReviewWidget({
    super.key,
    required this.reviewerName,
    required this.profileImageUrl,
    required this.rating,
    required this.reviewText,
    required this.reviewDate,
  });

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String truncatedReview = widget.reviewText;
    if (!_isExpanded && widget.reviewText.length > 100) {
      truncatedReview = '${widget.reviewText.substring(0, 100)}...';
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.reviewerName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: index < widget.rating
                                ? AppColors.accentColor
                                : AppColors.white,
                            size: 18,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.reviewDate,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              truncatedReview,
              style: const TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            if (!_isExpanded && widget.reviewText.length > 100)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: const Text(
                  'Read more',
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (_isExpanded)
              Text(
                widget.reviewText.substring(100),
                style: const TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
