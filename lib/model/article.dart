class Article {
  String? id;
  String? title;
  String? date;
  String? author;
  String? urlArtikel;
  String? description;

  String? get deskripsi => description;

  set deskripsi(String? deskripsi) {
    description = deskripsi;
  }
  String? image;

  String? get gambar => image;

  set gambar(String? image) {
    image = image;
  }

  Article(
      {this.author,
      this.date,
      this.description,
      this.id,
      this.image,
      this.title,
      this.urlArtikel});
}
