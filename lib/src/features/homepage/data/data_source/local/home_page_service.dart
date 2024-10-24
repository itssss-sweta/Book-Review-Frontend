import 'dart:convert';

import 'package:book_review/src/core/utils/constant/ui_texts.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/domain/models/genre_model.dart';
import 'package:flutter/services.dart';

class HomePageService {
  Future<({BookListModel? success, String? error})> fetchBookList() async {
    try {
      String response = await rootBundle.loadString(UiTexts.bookJson);
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

  Future<({BookListModel? success, String? error})>
      fetchRecommendedBookList() async {
    try {
      String response = await rootBundle.loadString(UiTexts.recommedBookJson);
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

  Future<({BookListModel? success, String? error})>
      fetchTrendingBookList() async {
    try {
      String response = await rootBundle.loadString(UiTexts.trendingJson);
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

  Future<({BookListModel? success, String? error})> fetchNewBookList() async {
    try {
      String response = await rootBundle.loadString(UiTexts.newBooksJson);
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

  Future<({GenreListModel? success, String? error})> fetchGenreList() async {
    try {
      String response = await rootBundle.loadString(UiTexts.genreJson);
      final decodedJson = jsonDecode(response);
      final success = GenreListModel.fromJson(decodedJson);
      return (success: success, error: null);
    } catch (e) {
      return (
        success: null,
        error: "Unexpected Error Occured, please try again later, $e"
      );
    }
  }
}
