import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';

abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class BookListLoading extends HomePageState {}

class BookListLoaded extends HomePageState {
  BookListModel bookListModel;
  BookListLoaded({required this.bookListModel});
}

class BookListError extends HomePageState {
  String error;
  BookListError({required this.error});
}

class LogoutSuccessful extends HomePageState {}

class LogoutLoading extends HomePageState {}
