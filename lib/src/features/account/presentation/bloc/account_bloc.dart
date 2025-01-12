import 'package:book_review/src/features/account/domain/models/my_list_model.dart';
import 'package:book_review/src/features/account/presentation/bloc/account_event.dart';
import 'package:book_review/src/features/account/presentation/bloc/account_state.dart';
import 'package:book_review/src/shared/data/data_source/local/cache_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountState()) {
    on<AddToListEvent>(_addToMyList);
    on<LogoutEvent>(_onLogout);
  }

  List<MyListModel> myListBooks = [];

  Future<void> _onLogout(LogoutEvent event, Emitter<AccountState> emit) async {
    emit(state.copyWith(isLoggingOut: true));
    await Future.delayed(const Duration(seconds: 5));
    CacheServices.getCacheServicesInstance.saveAccessToken('');
    CacheServices.getCacheServicesInstance.saveIsLogin(false);
    emit(state.copyWith(
      isLoggingOut: false,
      logoutSuccessful: true,
    ));
  }

  void _addToMyList(AddToListEvent event, Emitter<AccountState> emit) {
    if (myListBooks.any((element) => element.book?.isbn == event.book.isbn)) {
      myListBooks
          .removeWhere(((element) => element.book?.isbn == event.book.isbn));
    }
    myListBooks.add(MyListModel(book: event.book, bookStatus: event.status));
    emit(state.copyWith(myListAddedMessage: 'Book Added to My List'));
  }
}
