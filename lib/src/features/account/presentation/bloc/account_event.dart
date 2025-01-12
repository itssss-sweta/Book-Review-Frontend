import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';
import 'package:book_review/src/features/account/domain/models/my_list_model.dart';

abstract class AccountEvent {}

class LogoutEvent extends AccountEvent {}

class AddToListEvent extends AccountEvent {
  final Book book;
  final StatusModel status;

  AddToListEvent({required this.book, required this.status});
}
