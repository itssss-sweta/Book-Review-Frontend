class GenreListModel {
  List<Genre>? genres;

  GenreListModel({this.genres});

  GenreListModel.fromJson(Map<String, dynamic> json) {
    genres = json["genres"] == null
        ? null
        : (json["genres"] as List).map((e) => Genre.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (genres != null) {
      json["genres"] = genres?.map((e) => e.toJson()).toList();
    }
    return json;
  }
}

class Genre {
  int? id;
  String? name;
  String? image;
  int? bookCount;

  Genre({this.id, this.name, this.image, this.bookCount});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    bookCount = json["book_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["id"] = id;
    json["name"] = name;
    json["image"] = image;
    json["book_count"] = bookCount;
    return json;
  }
}
