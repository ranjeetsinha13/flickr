class MovieModel {
  int _page;

  get page => _page;

  int _totalResults;

  get totalResults => _totalResults;

  int _totalPages;

  get totalPages => _totalPages;

  List<_MovieResult> _results = [];

  get results => _results;

  MovieModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];
    List<_MovieResult> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _MovieResult result = _MovieResult(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }
}

class _MovieResult {
  _MovieResult(result) {
    _voteCount = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _voteAverage = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _posterPath = result['poster_path'];
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genreIds.add(result['genre_ids'][i]);
    }
    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _releaseDate = result['release_date'];
  }

  int _voteCount;

  get voteCount => _voteCount;
  int _id;

  get id => _id;
  bool _video;

  get video => _video;

  var _voteAverage;

  get voteAverage => _voteAverage;
  String _title;

  get title => _title;

  double _popularity;

  get popularity => _popularity;

  String _posterPath;

  get posterPath => _posterPath;

  String _originalLanguage;

  get originalLanguage => _originalLanguage;

  String _originalTitle;

  get originalTitle => _originalTitle;

  List<int> _genreIds = [];

  get genreIds => _genreIds;

  String _backdropPath;

  get backdropPath => _backdropPath;

  bool _adult;

  get adult => _adult;

  String _overview;

  get overview => _overview;

  String _releaseDate;

  get releaseDate => _releaseDate;
}
