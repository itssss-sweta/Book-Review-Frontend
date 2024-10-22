import 'package:book_review/src/features/homepage/data/repository/home_page_repository_dummy_impl.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/homepage/domain/repository/homepage_repository.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_event.dart';
import 'package:book_review/src/features/homepage/presentation/bloc/homepage_state.dart';
import 'package:book_review/src/shared/data/data_source/local/cache_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<LogoutEvent>(_onLogout);
    on<BookListFetchEvent>(_onBookListFetch);
  }

  final HomePageRepository _homePageRepositoryLocal =
      HomePageRepositoryDummyImpl();
  late BookListModel? bookList;
  String errorMessage = "";

  Future<void> _onLogout(LogoutEvent event, Emitter<HomePageState> emit) async {
    emit(LogoutLoading());
    await Future.delayed(const Duration(seconds: 2));
    CacheServices.getCacheServicesInstance.saveAccessToken('');
    CacheServices.getCacheServicesInstance.saveIsLogin(false);
    emit(LogoutSuccessful());
  }

  Future<void> _onBookListFetch(
      BookListFetchEvent event, Emitter<HomePageState> emit) async {
    emit(BookListLoading());

    final result = await _homePageRepositoryLocal.getBookList();
    if (result.success != null) {
      bookList = result.success;
      emit(BookListLoaded(bookListModel: bookList!));
    } else {
      errorMessage = result.error ?? '';
      emit(BookListError(error: errorMessage));
    }
  }
}
