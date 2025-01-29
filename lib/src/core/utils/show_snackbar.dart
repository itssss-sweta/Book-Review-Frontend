import 'package:flutter/material.dart';

class ShowSnackbar {
  static void showSnackBar(BuildContext context,
      {required String title, required Color backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
