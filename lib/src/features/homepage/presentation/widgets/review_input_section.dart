import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/shared/presentation/widgets/base_primary_button.dart';
import 'package:flutter/material.dart';

class ReviewInputSection extends StatefulWidget {
  final void Function()? onPost;
  final void Function()? onCancel;
  const ReviewInputSection({
    super.key,
    this.onPost,
    this.onCancel,
  });

  @override
  State<ReviewInputSection> createState() => _ReviewInputSectionState();
}

class _ReviewInputSectionState extends State<ReviewInputSection> {
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: TextFormField(
            controller: reviewController,
            maxLines: 20,
            decoration: const InputDecoration(
              hintText: 'Write a Review',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: AppColors.cardColor)),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            BasePrimaryButton(
              onPressed: widget.onPost,
              label: 'Post',
              buttonColor: AppColors.primaryColor.withOpacity(0.8),
              buttonWidth: MediaQuery.sizeOf(context).width / 3.2,
              buttonHeight: 40,
              borderRadius: 8.0,
            ),
            const SizedBox(
              width: 10,
            ),
            BasePrimaryButton(
              onPressed: widget.onCancel,
              label: 'Cancel',
              buttonColor: AppColors.accentColor.withOpacity(0.8),
              buttonWidth: MediaQuery.sizeOf(context).width / 3.2,
              buttonHeight: 40,
              borderRadius: 8.0,
            ),
          ],
        ),
      ],
    );
  }
}
