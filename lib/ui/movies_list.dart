import 'package:flickr/bloc/movies_bloc.dart';
import 'package:flickr/models/movie_model.dart';
import 'package:flickr/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopularMoviesList extends MoviesList {
  PopularMoviesList(String listType) : super(listType);
}

class UpcomingMoviesList extends MoviesList {
  UpcomingMoviesList(String listType) : super(listType);
}

class TopRatedMoviesList extends MoviesList {
  TopRatedMoviesList(String listType) : super(listType);
}

class MoviesList extends StatefulWidget {
  final String listType;

  const MoviesList(this.listType);

  @override
  State<StatefulWidget> createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MoviesList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies(widget.listType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<MovieModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<MovieModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
              child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.network(
                  'https://image.tmdb.org/t/p/w400${snapshot.data.results[index].backdropPath}',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 4.0,
                end: 4.0,
                top: 4.0,
                child: Container(
                  child: Text(
                    snapshot.data.results[index].title,
                    style: movieListTextStyle,
                  ),
                ),
              ),
              Positioned.directional(
                textDirection: TextDirection.rtl,
                start: 20,
                bottom: 4.0,
                child: Container(
                  child: Text(
                    snapshot.data.results[index].voteAverage
                        .toString()
                        .toUpperCase(),
                    style: movieRatingTextStyle,
                  ),
                ),
              )
            ],
          ));
        });
  }
}
