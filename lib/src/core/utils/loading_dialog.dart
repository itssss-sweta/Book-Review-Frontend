import 'package:book_review/src/features/authentication/presentation/widgets/custom_loader_widget.dart';
import 'package:flutter/material.dart';

class LoadingDialog {
  /// A dialog that shows custom loading indicator and a title.
  static void showLoadingDialog(BuildContext context,
      {required String loadingTitle}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: CustomLoaderWidget(
            loadingTitle: loadingTitle,
          ),
        );
      },
    );
  }
}
