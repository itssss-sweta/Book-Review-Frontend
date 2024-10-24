import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListviewShimmer extends StatelessWidget {
  final double? boxHeight;
  final double? contentHeight;
  final double? contentWidth;
  const ListviewShimmer(
      {super.key,
      this.boxHeight = 200,
      this.contentHeight = 200,
      this.contentWidth = 200});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: boxHeight,
      child: Shimmer.fromColors(
        baseColor: AppColors.cardColor,
        highlightColor: AppColors.backgroundColor,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              width: contentWidth,
              height: contentWidth,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
            );
          },
        ),
      ),
    );
  }
}
