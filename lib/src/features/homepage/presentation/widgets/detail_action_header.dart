import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class BookActionHeader extends StatelessWidget {
  const BookActionHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
