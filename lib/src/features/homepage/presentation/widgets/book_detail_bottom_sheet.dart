import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/features/account/domain/models/my_list_model.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_event.dart';
import 'package:book_review/src/shared/presentation/widgets/base_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailBottomSheet extends StatefulWidget {
  final Book book;

  const BookDetailBottomSheet({
    super.key,
    required this.book,
  });

  @override
  State<BookDetailBottomSheet> createState() => _BookDetailBottomSheetState();
}

class _BookDetailBottomSheetState extends State<BookDetailBottomSheet> {
  final TextEditingController pageController = TextEditingController();

  final TextEditingController statusController = TextEditingController();

  final TextEditingController rateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomePageBloc>();
    final keyboardHeight = MediaQuery.viewInsetsOf(context).bottom;
    return Padding(
      padding: EdgeInsets.only(
        top: 24.0,
        bottom: keyboardHeight + 24.0,
        left: 16.0,
        right: 16.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.book.title ?? '',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12.0),
            BlocProvider(
              create: (context) => HomePageBloc(),
              child: Row(
                children: [
                  _buildStatusDropDown(),
                  const SizedBox(width: 8.0),
                  _buildPageInputField(),
                ],
              ),
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
                    onPressed: () {
                      homeBloc.add(AddToListEvent(
                          book: widget.book,
                          status: StatusModel(
                              pages: int.parse(pageController.text.isEmpty
                                  ? '0'
                                  : pageController.text),
                              rating: double.parse(rateController.value.text),
                              status: statusController.value.text)));
                      Navigator.pop(context);
                    },
                    label: 'Submit',
                    borderRadius: 8.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildStatusDropDown() {
    return DropdownMenu(
      controller: statusController,
      onSelected: (value) {
        statusController.text = value ?? '';
        pageController.text = (widget.book.pageCount ?? 0).toString();
      },
      hintText: 'Status',
      dropdownMenuEntries: const [
        DropdownMenuEntry(label: 'Reading', value: 'Reading'),
        DropdownMenuEntry(label: 'Completed', value: 'Completed'),
        DropdownMenuEntry(label: 'On Hold', value: 'On Hold'),
        DropdownMenuEntry(label: 'Plan to Read', value: 'Plan to Read'),
        DropdownMenuEntry(label: 'Dropped', value: 'Dropped'),
      ],
    );
  }

  _buildPageInputField() {
    return Flexible(
      child: TextFormField(
        enabled: statusController.text == 'Completed' ? false : true,
        controller: pageController,
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
              '/${widget.book.pageCount}',
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
    return DropdownMenu(
      controller: rateController,
      hintText: 'Select',
      onSelected: (value) {
        rateController.text = value ?? '0';
      },
      trailingIcon: const Icon(Icons.star, color: AppColors.accentColor),
      dropdownMenuEntries: const [
        DropdownMenuEntry(label: '(5) Excellent', value: '5'),
        DropdownMenuEntry(label: '(4) Very Good', value: '4'),
        DropdownMenuEntry(label: '(3) Good', value: '3'),
        DropdownMenuEntry(label: '(2) Average', value: '2'),
        DropdownMenuEntry(label: '(1) Bad', value: '1'),
      ],
    );
  }
}
