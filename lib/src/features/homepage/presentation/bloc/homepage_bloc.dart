import 'package:book_review/src/features/homepage/data/repository/home_page_repository_dummy_impl.dart';
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

  Future<void> _onLogout(LogoutEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(isLoggingOut: true));
    await Future.delayed(const Duration(seconds: 2));
    CacheServices.getCacheServicesInstance.saveAccessToken('');
    CacheServices.getCacheServicesInstance.saveIsLogin(false);
    emit(state.copyWith(
      isLoggingOut: false,
      logoutSuccessful: true,
    ));
  }

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
}
