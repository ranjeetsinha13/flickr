import 'package:flutter/material.dart';

const APP_TITLE = "Flickr";

// Tab bar titles

const UP_COMING = "Upcoming";
const TOP_RATED = "Top Rated";
const POPULAR = "Popular";
const FAVORITES = "Favorites";

const movieListKeys = ['upcoming', 'top_rated', 'popular'];

const Map<String, Icon> tabs = {
  UP_COMING: const Icon(Icons.local_movies),
  TOP_RATED: const Icon(Icons.title),
  POPULAR: const Icon(Icons.label_important),
  FAVORITES: const Icon(Icons.favorite)
};
