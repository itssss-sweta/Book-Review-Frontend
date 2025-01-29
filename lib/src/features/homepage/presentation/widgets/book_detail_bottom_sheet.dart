import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/core/utils/constant/regex.dart';
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

  double? rate;

  String? status;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
        child: Form(
          key: formKey,
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
                  const SizedBox(width: 12.0),
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
                        if (formKey.currentState?.validate() ?? false) {
                          homeBloc.add(AddToListEvent(
                              book: widget.book,
                              status: StatusModel(
                                  pages: int.parse(pageController.text.isEmpty
                                      ? '0'
                                      : pageController.text),
                                  rating: rate ?? 0.0,
                                  status: status)));
                          Navigator.pop(context);
                        }
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
      ),
    );
  }

  _buildStatusDropDown() {
    return Flexible(
      child: DropdownButtonFormField(
        validator: (value) {
          if (value.isNullOrEmpty) {
            return 'Field Required';
          }
          return null;
        },
        value: status,
        onChanged: (value) {
          status = value;
          if (value == 'Completed') {
            pageController.text = (widget.book.pageCount ?? 0).toString();
          }
        },
        decoration: const InputDecoration(
          hintText: 'Status',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
              color: AppColors.secondaryTextColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
              color: AppColors.secondaryTextColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
              color: AppColors.secondaryTextColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
              color: AppColors.errorColor,
            ),
          ),
        ),
        items: const [
          DropdownMenuItem(value: 'Reading', child: Text('Reading')),
          DropdownMenuItem(value: 'Completed', child: Text('Completed')),
          DropdownMenuItem(value: 'On Hold', child: Text('On Hold')),
          DropdownMenuItem(value: 'Plan to Read', child: Text('Plan to Read')),
          DropdownMenuItem(value: 'Dropped', child: Text('Dropped')),
        ],
      ),
    );
  }

  _buildPageInputField() {
    return Flexible(
      child: TextFormField(
        enabled: status == 'Completed' ? false : true,
        controller: pageController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.end,
        validator: (value) {
          if (value.isNullOrEmpty) {
            value = '0';
          }
          if (int.parse(value!) > (widget.book.pageCount ?? 0)) {
            return 'Invalid Page Count';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: AppColors.secondaryTextColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: AppColors.errorColor),
          ),
        ),
      ),
    );
  }

  _buildRateDropDown() {
    return Flexible(
      child: DropdownButtonFormField(
        validator: (value) {
          if (value == null || value <= 0) {
            return 'Field Required';
          }
          return null;
        },
        value: rate,
        onChanged: (value) {
          rate = value;
        },
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.star, color: AppColors.accentColor),
          hintText: 'Select',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
              color: AppColors.secondaryTextColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
              color: AppColors.secondaryTextColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
              color: AppColors.secondaryTextColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
              color: AppColors.errorColor,
            ),
          ),
        ),
        items: const [
          DropdownMenuItem(value: 5.0, child: Text('(5) Excellent')),
          DropdownMenuItem(value: 4.0, child: Text('(4) Very Good')),
          DropdownMenuItem(value: 3.0, child: Text('(3) Good')),
          DropdownMenuItem(value: 2.0, child: Text('(2) Average')),
          DropdownMenuItem(value: 1.0, child: Text('(1) Bad')),
        ],
      ),
    );
  }
}
