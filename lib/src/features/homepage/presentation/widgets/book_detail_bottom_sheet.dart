import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/shared/presentation/widgets/base_primary_button.dart';
import 'package:flutter/material.dart';

class BookDetailBottomSheet extends StatelessWidget {
  final Book book;

  const BookDetailBottomSheet({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.title ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              _buildStatusDropDown(),
              const SizedBox(width: 8.0),
              _buildPageInputFiels(context, book),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Rate', style: Theme.of(context).textTheme.labelMedium),
              _buildRateDropDown(),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 2,
                child: BasePrimaryButton(
                  onPressed: () => Navigator.pop(context),
                  label: 'Cancel',
                  buttonColor: AppColors.cardColor,
                  textColor: AppColors.primaryColor,
                  borderColor: AppColors.disabledButtonColor,
                  borderRadius: 8.0,
                ),
              ),
              const Flexible(flex: 1, child: SizedBox()),
              Flexible(
                flex: 2,
                child: BasePrimaryButton(
                  buttonColor: AppColors.secondaryColor.withOpacity(0.8),
                  onPressed: () {},
                  label: 'Submit',
                  borderRadius: 8.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_buildStatusDropDown() {
  return const DropdownMenu(
    hintText: 'Status',
    dropdownMenuEntries: [
      DropdownMenuEntry(label: 'Reading', value: 'Reading'),
      DropdownMenuEntry(label: 'Completed', value: 'Completed'),
      DropdownMenuEntry(label: 'On Hold', value: 'On Hold'),
      DropdownMenuEntry(label: 'Plan to Read', value: 'Plan to Read'),
      DropdownMenuEntry(label: 'Dropped', value: 'Dropped'),
    ],
  );
}

_buildPageInputFiels(BuildContext context, Book book) {
  return Flexible(
    child: TextFormField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.end,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
        hintText: '0',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.center,
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Text(
              'Pages',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        suffixIcon: Align(
          alignment: Alignment.center,
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Text(
            '/${book.pageCount}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.secondaryTextColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.secondaryTextColor),
        ),
      ),
    ),
  );
}

_buildRateDropDown() {
  return const DropdownMenu(
    hintText: 'Select',
    trailingIcon: Icon(Icons.star, color: AppColors.accentColor),
    dropdownMenuEntries: [
      DropdownMenuEntry(label: '(5) Excellent', value: '5'),
      DropdownMenuEntry(label: '(4) Very Good', value: '4'),
      DropdownMenuEntry(label: '(3) Good', value: '3'),
      DropdownMenuEntry(label: '(2) Average', value: '2'),
      DropdownMenuEntry(label: '(1) Bad', value: '1'),
    ],
  );
}
