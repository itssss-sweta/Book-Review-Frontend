import 'package:book_review/src/features/homepage/domain/models/book_list_model.dart';

class MyListModel {
  Book? book;
  StatusModel? bookStatus;

  MyListModel({this.book, this.bookStatus});

  MyListModel.fromJson(Map<String, dynamic> json) {
    book = json["book"];
    bookStatus = json["bookStatus"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["book"] = book;
    json["bookStatus"] = bookStatus;
    return json;
  }
}

class StatusModel {
  double? rating;
  String? status;
  int? pages;

  StatusModel({this.rating, this.status, this.pages});

  StatusModel.fromJson(Map<String, dynamic> json) {
    rating = json["rating"];
    status = json["status"];
    pages = json["pages"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["rating"] = rating;
    json["status"] = status;
    json["pages"] = pages;
    return json;
  }
}
