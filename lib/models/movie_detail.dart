class MovieDetail{
  final String title;
  final String imdbId;
  final String poster;
  final String year;
  final String released;
  final String genre;
  final String actors;
  final String writer;
  final String plot;

  MovieDetail({required this.title,required this.genre,required this.imdbId,required this.poster,required this.year,required this.released,required this.actors,required this.writer,required this.plot});

  factory MovieDetail.fromJson(Map<String, dynamic> json){
    return MovieDetail(title: json["Title"], genre: json["Genre"], imdbId: json["imdbID"], poster: json["Poster"], year: json["Year"], released: json["Released"], actors: json["Actors"], writer: json["Writer"], plot: json["Plot"]);
  }
}