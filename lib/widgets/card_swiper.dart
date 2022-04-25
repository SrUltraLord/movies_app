import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:movies_app/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: screenSize.height * 0.55,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: screenSize.height * 0.55,
      // color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: screenSize.width * 0.6,
          itemHeight: screenSize.height * 0.9,
          itemBuilder: (_, int index) {
            final movie = movies[index];

            movie.heroId = 'swiper-${movie.id}';

            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: movie),
              child: Hero(
                tag: movie.heroId!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(movie.fullPosterImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }, // AssetImage(assetName),
        ),
      ),
    );
  }
}
