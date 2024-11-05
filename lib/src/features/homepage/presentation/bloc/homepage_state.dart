import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/domain/models/genre_model.dart';

class HomePageState {
  final bool isLoadingBooks;
  final bool isLoadingRecommendedBooks;
  final bool isLoadingTrendingBooks;
  final bool isLoadingNewBooks;
  final bool isLoadingGenres;
  final bool isLoggingOut;
  final bool logoutSuccessful;
  final BookListModel? bookList;
  final BookListModel? trendingBookList;
  final BookListModel? recommendedBookList;
  final BookListModel? newBookList;
  final GenreListModel? genreList;
  final String? bookError;
  final String? trendingBookError;
  final String? recommendeBookError;
  final String? newBookError;
  final String? genreError;
  final String? logoutError;

  HomePageState({
    this.isLoadingBooks = false,
    this.isLoadingGenres = false,
    this.isLoggingOut = false,
    this.logoutSuccessful = false,
    this.isLoadingRecommendedBooks = false,
    this.isLoadingTrendingBooks = false,
    this.isLoadingNewBooks = false,
    this.trendingBookList,
    this.recommendedBookList,
    this.newBookList,
    this.trendingBookError,
    this.recommendeBookError,
    this.newBookError,
    this.bookList,
    this.genreList,
    this.bookError,
    this.genreError,
    this.logoutError,
  });

  HomePageState copyWith({
    bool? isLoadingBooks,
    bool? isLoadingGenres,
    bool? isLoggingOut,
    bool? logoutSuccessful,
    BookListModel? bookList,
    GenreListModel? genreList,
    String? bookError,
    String? genreError,
    String? logoutError,
    bool? isLoadingRecommendedBooks,
    bool? isLoadingTrendingBooks,
    bool? isLoadingNewBooks,
    BookListModel? trendingBookList,
    BookListModel? recommendedBookList,
    BookListModel? newBookList,
    String? trendingBookError,
    String? recommendeBookError,
    String? newBookError,
  }) {
    return HomePageState(
      isLoadingBooks: isLoadingBooks ?? this.isLoadingBooks,
      isLoadingGenres: isLoadingGenres ?? this.isLoadingGenres,
      isLoggingOut: isLoggingOut ?? this.isLoggingOut,
      isLoadingNewBooks: isLoadingNewBooks ?? this.isLoadingNewBooks,
      isLoadingRecommendedBooks:
          isLoadingRecommendedBooks ?? this.isLoadingRecommendedBooks,
      isLoadingTrendingBooks:
          isLoadingTrendingBooks ?? this.isLoadingTrendingBooks,
      logoutSuccessful: logoutSuccessful ?? this.logoutSuccessful,
      bookList: bookList ?? this.bookList,
      newBookList: newBookList ?? this.newBookList,
      recommendedBookList: recommendedBookList ?? this.recommendedBookList,
      trendingBookList: trendingBookList ?? this.trendingBookList,
      genreList: genreList ?? this.genreList,
      bookError: bookError ?? this.bookError,
      recommendeBookError: recommendeBookError ?? this.recommendeBookError,
      newBookError: newBookError ?? this.newBookError,
      trendingBookError: trendingBookError ?? this.trendingBookError,
      genreError: genreError ?? this.genreError,
      logoutError: logoutError ?? this.logoutError,
    );
  }
}
