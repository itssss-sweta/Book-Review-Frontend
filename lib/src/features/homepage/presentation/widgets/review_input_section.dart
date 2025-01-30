import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/core/utils/show_snackbar.dart';
import 'package:book_review/src/shared/presentation/widgets/base_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewInputSection extends StatefulWidget {
  const ReviewInputSection({
    super.key,
  });

  @override
  State<ReviewInputSection> createState() => _ReviewInputSectionState();
}

class _ReviewInputSectionState extends State<ReviewInputSection> {
  final TextEditingController reviewController = TextEditingController();

  final FocusNode focusNode = FocusNode();

  bool reviewWritten = false;

  @override
  Widget build(BuildContext context) {
    return !reviewWritten
        ? Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
                onPressed: () {
                  reviewWritten = true;
                  setState(() {});
                },
                child: const Text('+ Write a review')),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: TextFormField(
                  focusNode: focusNode,
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
                    onPressed: () {
                      if (reviewController.text.trim().isEmpty) {
                        ShowSnackbar.showSnackBar(context,
                            title: "Review Field required to post review",
                            backgroundColor: AppColors.errorColor);
                      } else {
                        _showRatingBottomSheet(context);
                      }
                    },
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
                    onPressed: () {
                      reviewWritten = !reviewWritten;
                      setState(() {});
                    },
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

  void _showRatingBottomSheet(BuildContext context) {
    double selectedRating = 0;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      isScrollControlled: true,
      constraints: const BoxConstraints(minWidth: double.infinity),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Rate this book!',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              RatingBar.builder(
                initialRating: selectedRating,
                direction: Axis.horizontal,
                itemCount: 5,
                minRating: 1,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 14,
                ),
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {
                  selectedRating = rating;
                },
              ),
              BasePrimaryButton(
                onPressed: () async {
                  if (context.mounted) {
                    ShowSnackbar.showSnackBar(context,
                        title: "Review Posted!",
                        backgroundColor: AppColors.successColor);
                    Navigator.pop(context);
                    focusNode.unfocus();
                    reviewController.clear();
                    reviewWritten = false;
                    setState(() {});
                  }
                },
                buttonColor: AppColors.accentColor,
                label: 'Submit',
                buttonWidth: MediaQuery.sizeOf(context).width / 3,
                borderRadius: 8.0,
                buttonHeight: 20,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }
}
