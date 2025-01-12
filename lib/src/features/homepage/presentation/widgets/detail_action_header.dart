import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookActionHeader extends StatelessWidget {
  final Book book;
  const BookActionHeader({super.key, required this.book});

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
          _buildIcon(context, icon: Icons.bookmark, onTap: () {
            context.read<HomePageBloc>().add(AddToFavouriteEvent(book));
          }),
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
