import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'c462a8010a1d55f236a33eb67ca22a68';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    getNowPlayingMovies();
    getPopularMovies();
  }

  getNowPlayingMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    nowPlayingMovies = nowPlayingResponse.results;
    notifyListeners(); // Les avisa a los listeners que algo ha cambiado
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    popularMovies = [...popularMovies, ...popularResponse.results];
    print(popularMovies);

    notifyListeners(); // Les avisa a los listeners que algo ha cambiado
  }
}
