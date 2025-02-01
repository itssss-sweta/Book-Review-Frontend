import 'package:book_review/src/features/account/domain/models/my_list_model.dart';
import 'package:book_review/src/features/homepage/data/repository/home_page_repository_dummy_impl.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/domain/repository/homepage_repository.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_event.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState()) {
    on<DataFetchEvent>(_onDataFetch);
    on<AddToListEvent>(_addToMyList);
    on<RemoveFromListEvent>(_removeFromMyList);
    on<AddToFavouriteEvent>(_addToFavourite);
    on<RemoveFromFavouriteEvent>(_removeFromFavourite);
  }
  final HomePageRepository _homePageRepositoryLocal =
      HomePageRepositoryDummyImpl();

  List<MyListModel> myListBooks = [];

  List<Book> favouriteBooks = [];

  Future<void> _onDataFetch(
      DataFetchEvent event, Emitter<HomePageState> emit) async {
    await Future.wait([
      _fetchTrendingBooks(emit),
      _fetchBooks(emit),
      _fetchRecommendedBooks(emit),
      _fetchNewBooks(emit),
      _fetchGenres(emit),
    ]);
  }

  Future<void> _fetchBooks(Emitter<HomePageState> emit) async {
    emit(state.copyWith(isLoadingBooks: true));

    final result = await _homePageRepositoryLocal.getBookList();
    if (result.success != null) {
      emit(state.copyWith(isLoadingBooks: false, bookList: result.success));
    } else {
      emit(state.copyWith(isLoadingBooks: false, bookError: result.error));
    }
  }

  Future<void> _fetchTrendingBooks(Emitter<HomePageState> emit) async {
    emit(state.copyWith(isLoadingTrendingBooks: true));

    final result = await _homePageRepositoryLocal.getTrendingBookList();
    if (result.success != null) {
      emit(state.copyWith(
          isLoadingTrendingBooks: false, trendingBookList: result.success));
    } else {
      emit(state.copyWith(
          isLoadingTrendingBooks: false, trendingBookError: result.error));
    }
  }

  Future<void> _fetchRecommendedBooks(Emitter<HomePageState> emit) async {
    emit(state.copyWith(isLoadingRecommendedBooks: true));

    final result = await _homePageRepositoryLocal.getRecommendedBookList();
    if (result.success != null) {
      emit(state.copyWith(
          isLoadingRecommendedBooks: false,
          recommendedBookList: result.success));
    } else {
      emit(state.copyWith(
          isLoadingRecommendedBooks: false, recommendeBookError: result.error));
    }
  }

  Future<void> _fetchNewBooks(Emitter<HomePageState> emit) async {
    emit(state.copyWith(isLoadingNewBooks: true));

    final result = await _homePageRepositoryLocal.getNewBooksList();
    if (result.success != null) {
      emit(state.copyWith(
          isLoadingNewBooks: false, newBookList: result.success));
    } else {
      emit(
          state.copyWith(isLoadingNewBooks: false, newBookError: result.error));
    }
  }

  Future<void> _fetchGenres(Emitter<HomePageState> emit) async {
    emit(state.copyWith(isLoadingGenres: true));

    final result = await _homePageRepositoryLocal.getGenreList();
    if (result.success != null) {
      emit(state.copyWith(isLoadingGenres: false, genreList: result.success));
    } else {
      emit(state.copyWith(isLoadingGenres: false, genreError: result.error));
    }
  }

  void _addToMyList(AddToListEvent event, Emitter<HomePageState> emit) {
    if (myListBooks.any((element) => element.book?.isbn == event.book.isbn)) {
      myListBooks
          .removeWhere(((element) => element.book?.isbn == event.book.isbn));
    }
    myListBooks.add(MyListModel(book: event.book, bookStatus: event.status));
    emit(state.copyWith(myListAddedMessage: 'Book Added to My List'));
  }

  void _removeFromMyList(
      RemoveFromListEvent event, Emitter<HomePageState> emit) {
    if (myListBooks.any((element) => element.book?.isbn == event.book.isbn)) {
      myListBooks
          .removeWhere(((element) => element.book?.isbn == event.book.isbn));
    }
    emit(state.copyWith(myListDeletedMessage: 'Book Removed from My List'));
  }

  void _addToFavourite(AddToFavouriteEvent event, Emitter<HomePageState> emit) {
    if (!favouriteBooks.any((book) => book.isbn == event.book.isbn)) {
      favouriteBooks.add(event.book);
    }
    emit(state.copyWith(addToFavouriteMessage: 'Book Added to My Favourites'));
  }

  void _removeFromFavourite(
      RemoveFromFavouriteEvent event, Emitter<HomePageState> emit) {
    favouriteBooks.removeWhere((book) => book.isbn == event.book.isbn);
    emit(state.copyWith(
        removeFromFavouriteMessage: 'Book Removed from My Favourites'));
  }
}
