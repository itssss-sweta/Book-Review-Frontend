import 'package:flutter/material.dart';

class LoadingDialog {
  static bool isLoadingDialogVisible = false;

  static void showLoadingDialog(BuildContext context) {
    if (isLoadingDialogVisible) return;

    isLoadingDialogVisible = true;

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
    isLoadingDialogVisible = false;
  }
}
