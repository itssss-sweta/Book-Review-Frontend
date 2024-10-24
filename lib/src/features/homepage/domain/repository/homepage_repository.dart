import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/domain/models/genre_model.dart';

abstract class HomePageRepository {
  Future<({BookListModel? success, String? error})> getBookList();

  Future<({BookListModel? success, String? error})> getRecommendedBookList();

  Future<({BookListModel? success, String? error})> getTrendingBookList();

  Future<({BookListModel? success, String? error})> getNewBooksList();

  Future<({GenreListModel? success, String? error})> getGenreList();
}
