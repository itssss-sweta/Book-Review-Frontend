import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/domain/models/genre_model.dart';

class HomePageState {
  final bool isLoadingBooks;
  final bool isLoadingRecommendedBooks;
  final bool isLoadingTrendingBooks;
  final bool isLoadingNewBooks;
  final bool isLoadingGenres;
  final BookListModel? bookList;
  final BookListModel? trendingBookList;
  final BookListModel? recommendedBookList;
  final BookListModel? newBookList;
  final GenreListModel? genreList;
  final List<Book>? favouriteBooks;
  final String? bookError;
  final String? trendingBookError;
  final String? recommendeBookError;
  final String? newBookError;
  final String? genreError;
  final String? myListAddedMessage;

  HomePageState({
    this.isLoadingBooks = false,
    this.isLoadingGenres = false,
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
    this.favouriteBooks,
    this.myListAddedMessage,
  });

  HomePageState copyWith({
    bool? isLoadingBooks,
    bool? isLoadingGenres,
    BookListModel? bookList,
    GenreListModel? genreList,
    String? bookError,
    String? genreError,
    bool? isLoadingRecommendedBooks,
    bool? isLoadingTrendingBooks,
    bool? isLoadingNewBooks,
    BookListModel? trendingBookList,
    BookListModel? recommendedBookList,
    BookListModel? newBookList,
    String? trendingBookError,
    String? recommendeBookError,
    String? newBookError,
    List<Book>? favouriteBooks,
    String? myListAddedMessage,
  }) {
    return HomePageState(
      isLoadingBooks: isLoadingBooks ?? this.isLoadingBooks,
      isLoadingGenres: isLoadingGenres ?? this.isLoadingGenres,
      isLoadingNewBooks: isLoadingNewBooks ?? this.isLoadingNewBooks,
      isLoadingRecommendedBooks:
          isLoadingRecommendedBooks ?? this.isLoadingRecommendedBooks,
      isLoadingTrendingBooks:
          isLoadingTrendingBooks ?? this.isLoadingTrendingBooks,
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
      favouriteBooks: favouriteBooks ?? this.favouriteBooks,
      myListAddedMessage: myListAddedMessage ?? this.myListAddedMessage,
    );
  }
}
