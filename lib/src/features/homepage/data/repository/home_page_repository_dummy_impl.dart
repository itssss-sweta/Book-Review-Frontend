import 'package:book_review/src/features/homepage/data/data_source/local/home_page_service.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/domain/models/genre_model.dart';
import 'package:book_review/src/features/homepage/domain/repository/homepage_repository.dart';

class HomePageRepositoryDummyImpl extends HomePageRepository {
  final HomePageService _homePageService = HomePageService();
  @override
  Future<({String? error, BookListModel? success})> getBookList() async {
    final response = await _homePageService.fetchBookList();
    if (response.success != null) {
      return (error: null, success: response.success);
    }
    return (error: response.error, success: null);
  }

  @override
  Future<({String? error, GenreListModel? success})> getGenreList() async {
    final response = await _homePageService.fetchGenreList();
    if (response.success != null) {
      return (error: null, success: response.success);
    }
    return (error: response.error, success: null);
  }
}
