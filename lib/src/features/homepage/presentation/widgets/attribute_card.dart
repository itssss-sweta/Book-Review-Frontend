import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AttributeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String value;
  final Color iconColor;
  const AttributeCard({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.cardColor,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              const SizedBox(
                width: 4.0,
              ),
              Text(value),
            ],
          ),
        )
      ],
    );
  }
}
