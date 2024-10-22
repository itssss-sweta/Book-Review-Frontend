import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';

abstract class HomePageRepository {
  Future<({BookListModel? success, String? error})> getBookList();
}
