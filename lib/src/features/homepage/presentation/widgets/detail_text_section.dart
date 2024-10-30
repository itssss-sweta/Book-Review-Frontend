import 'package:flutter/material.dart';

class DetailTextSection extends StatelessWidget {
  final String title;
  final String? content;
  const DetailTextSection({super.key, required this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 20),
        ),
        Text(
          content ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
