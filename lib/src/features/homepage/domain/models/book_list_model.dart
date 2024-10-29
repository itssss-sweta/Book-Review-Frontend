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
  String? language;
  int? pageCount;
  String? targetAudience;
  String? description;
  String? edition;
  double? rating;

  Book(
      {this.title,
      this.author,
      this.publicationYear,
      this.genre,
      this.isbn,
      this.imageUrl,
      this.language,
      this.pageCount,
      this.targetAudience,
      this.description,
      this.rating,
      this.edition});

  Book.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    author = json["author"];
    publicationYear = json["publication_year"];
    genre = json["genre"];
    isbn = json["isbn"];
    imageUrl = json["image_url"];
    language = json["language"];
    pageCount = json["page_count"];
    targetAudience = json["target_audience"];
    description = json["description"];
    rating = json["rating"];
    edition = json["edition"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["title"] = title;
    json["author"] = author;
    json["publication_year"] = publicationYear;
    json["genre"] = genre;
    json["isbn"] = isbn;
    json["image_url"] = imageUrl;
    json["language"] = language;
    json["page_count"] = pageCount;
    json["target_audience"] = targetAudience;
    json["description"] = description;
    json["edition"] = edition;
    json["rating"] = rating;
    return json;
  }
}
