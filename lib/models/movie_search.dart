class MovieSearch {
  final String title;
  final String imdbId;
  final String poster;
  final String year;

  MovieSearch({required this.title, required this.imdbId, required this.poster, required this.year});

  factory MovieSearch.fromJson(Map<String, dynamic> json){
    return MovieSearch(title: json["Title"], imdbId: json["imdbID"], poster: json["Poster"], year: json["Year"]);
  }

  static List<MovieSearch> moviesFromJson(dynamic json){
    var searchResult = json["Search"];
    List<MovieSearch> results = List.empty(growable: true);

    if (searchResult != null){
      searchResult.forEach((v)=>{
        results.add(MovieSearch.fromJson(v))
      });
      return results;
    }
    return results;
  }
}