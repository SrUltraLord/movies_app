import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSlider(
      {Key? key, required this.movies, required this.onNextPage, this.title})
      : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if ((_scrollController.position.pixels + 500) >=
          _scrollController.position.maxScrollExtent) {
        widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
      return const SizedBox(
        width: double.infinity,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 275,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text(
                widget.title!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (_, i) => _MoviePoster(movie: widget.movies[i])),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;

  const _MoviePoster({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'slider-${movie.id}';

    return Container(
      width: 130,
      height: 260,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        GestureDetector(
          onTap: (() =>
              Navigator.pushNamed(context, 'details', arguments: movie)),
          child: Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          movie.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
