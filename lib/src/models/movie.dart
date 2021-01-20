class Movie {
  int id;
  String backdropPath;
  String title;
  String originalTitle;
  String originalLanguage;
  String releaseDate;
  double voteAverage;
  List<int> genreIds;
  String overview;

  Movie({
    this.id,
    this.backdropPath,
    this.title,
    this.originalTitle,
    this.originalLanguage,
    this.releaseDate,
    this.voteAverage,
    this.genreIds,
    this.overview,
  });
}
