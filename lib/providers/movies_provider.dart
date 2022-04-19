import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '<<key>>';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  MoviesProvider() {
    print('Movies provider created');

    getNowPlayingMovies();
  }

  getNowPlayingMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    for (var element in nowPlayingResponse.results) {
      print(element.title);
    }
  }
}
