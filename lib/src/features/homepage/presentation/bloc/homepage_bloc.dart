import 'package:book_review/src/features/homepage/data/repository/home_page_repository_dummy_impl.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/domain/models/genre_model.dart';
import 'package:book_review/src/features/homepage/domain/repository/homepage_repository.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_event.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_state.dart';
import 'package:book_review/src/shared/data/data_source/local/cache_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState()) {
    on<DataFetchEvent>(_onDataFetch);
    on<LogoutEvent>(_onLogout);
  }
  final HomePageRepository _homePageRepositoryLocal =
      HomePageRepositoryDummyImpl();
  late BookListModel? bookList;
  late GenreListModel? genreList;
  String errorMessage = "";
  String errorMessageGenre = "";

  Future<void> _onLogout(LogoutEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(
      isLoggingOut: true,
    ));
    await Future.delayed(const Duration(seconds: 2));
    CacheServices.getCacheServicesInstance.saveAccessToken('');
    CacheServices.getCacheServicesInstance.saveIsLogin(false);
    emit(state.copyWith(
      logoutSuccessful: true,
    ));
  }

  Future<void> _onDataFetch(
      DataFetchEvent event, Emitter<HomePageState> emit) async {
    // Start loading both books and genres
    emit(state.copyWith(isLoadingBooks: true, isLoadingGenres: true));

    // Fetch books and genres concurrently
    await Future.wait([
      _fetchBooks(emit),
      _fetchGenres(emit),
    ]);
  }

  Future<void> _fetchBooks(Emitter<HomePageState> emit) async {
    final result = await _homePageRepositoryLocal.getBookList();
    if (result.success != null) {
      // Update only the book-related part of the state
      emit(state.copyWith(isLoadingBooks: false, bookList: result.success));
    } else {
      emit(state.copyWith(isLoadingBooks: false, bookError: result.error));
    }
  }

  Future<void> _fetchGenres(Emitter<HomePageState> emit) async {
    final result = await _homePageRepositoryLocal.getGenreList();
    if (result.success != null) {
      // Update only the genre-related part of the state
      emit(state.copyWith(isLoadingGenres: false, genreList: result.success));
    } else {
      emit(state.copyWith(isLoadingGenres: false, genreError: result.error));
    }
  }
}
