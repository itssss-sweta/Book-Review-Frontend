import 'package:book_review/src/features/account/domain/models/my_list_model.dart';
import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';

abstract class HomePageEvent {}

class DataFetchEvent extends HomePageEvent {}

class AddToFavouriteEvent extends HomePageEvent {
  final Book book;
  AddToFavouriteEvent(this.book);
}

class AddToListEvent extends HomePageEvent {
  final Book book;
  StatusModel status;

  AddToListEvent({required this.book, required this.status});
}

class RemoveFromListEvent extends HomePageEvent {
  final Book book;

  RemoveFromListEvent({required this.book});
}
