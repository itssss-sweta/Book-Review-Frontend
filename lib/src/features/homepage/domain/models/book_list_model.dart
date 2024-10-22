class BookListModel {
  List<Book>? books;

  BookListModel({this.books});

  BookListModel.fromJson(Map<String, dynamic> json) {
    books = json["books"] == null
        ? null
        : (json["books"] as List).map((e) => Book.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (books != null) {
      json["books"] = books?.map((e) => e.toJson()).toList();
    }
    return json;
  }
}

class Book {
  String? title;
  String? author;
  int? publicationYear;
  String? genre;
  String? isbn;
  String? imageUrl;
  double? rating;
  String? description;
  String? publisher;

  Book(
      {this.title,
      this.author,
      this.publicationYear,
      this.genre,
      this.isbn,
      this.imageUrl,
      this.rating,
      this.description,
      this.publisher});

  Book.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    author = json["author"];
    publicationYear = json["publication_year"];
    genre = json["genre"];
    isbn = json["isbn"];
    imageUrl = json["image_url"];
    rating = json["rating"];
    description = json["description"];
    publisher = json["publisher"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["title"] = title;
    json["author"] = author;
    json["publication_year"] = publicationYear;
    json["genre"] = genre;
    json["isbn"] = isbn;
    json["image_url"] = imageUrl;
    json["rating"] = rating;
    json["description"] = description;
    json["publisher"] = publisher;
    return json;
  }
}
