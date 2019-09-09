import 'package:flickr/models/movie_model.dart';
import 'package:flickr/repository/movies_api.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = MoviesApi();

  int page =0;

  final _moviesFetcher = PublishSubject<MovieModel>();

  Observable<MovieModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies(String type) async {
    MovieModel movieModel = await _repository.fetchMovieList(type);
    _moviesFetcher.sink.add(movieModel);
  }

  fetchNextPage(String type) async {
    page++;
    MovieModel movieModel = await _repository.fetchMovieList(type, page: page);
    _moviesFetcher.sink.add(movieModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
