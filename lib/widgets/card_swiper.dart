import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: screenSize.height * 0.6,
      // color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.STACK,
          itemWidth: screenSize.width * 0.6,
          itemHeight: screenSize.height * 0.9,
          itemBuilder: (_, int index) => GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover,
              ),
            ),
          ), // AssetImage(assetName),
        ),
      ),
    );
  }
}
