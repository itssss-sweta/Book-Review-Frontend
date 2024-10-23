import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/domain/models/genre_model.dart';

class HomePageState {
  final bool isLoadingBooks;
  final bool isLoadingGenres;
  final bool isLoggingOut;
  final bool logoutSuccessful;
  final BookListModel? bookList;
  final GenreListModel? genreList;
  final String? bookError;
  final String? genreError;
  final String? logoutError;

  HomePageState({
    this.isLoadingBooks = false,
    this.isLoadingGenres = false,
    this.isLoggingOut = false,
    this.logoutSuccessful = false,
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
  }) {
    return HomePageState(
      isLoadingBooks: isLoadingBooks ?? this.isLoadingBooks,
      isLoadingGenres: isLoadingGenres ?? this.isLoadingGenres,
      isLoggingOut: isLoggingOut ?? this.isLoggingOut,
      logoutSuccessful: logoutSuccessful ?? this.logoutSuccessful,
      bookList: bookList ?? this.bookList,
      genreList: genreList ?? this.genreList,
      bookError: bookError ?? this.bookError,
      genreError: genreError ?? this.genreError,
      logoutError: logoutError ?? this.logoutError,
    );
  }
}
