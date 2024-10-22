import 'dart:convert';

import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:flutter/services.dart';

class HomePageService {
  Future<({BookListModel? success, String? error})> fetchBookList() async {
    try {
      String response =
          await rootBundle.loadString('assets/json/book_list.json');
      final decodedJson = jsonDecode(response);
      final success = BookListModel.fromJson(decodedJson);
      return (success: success, error: null);
    } catch (e) {
      return (
        success: null,
        error: "Unexpected Error Occured, please try again later, $e"
      );
    }
  }
}
