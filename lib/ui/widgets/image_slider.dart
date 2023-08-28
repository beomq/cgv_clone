import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key, required this.bannerUrlItems}) : super(key: key);

  final List<String> bannerUrlItems;
  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;

    return CarouselSlider.builder(
      options:
          CarouselOptions(height: 160, autoPlay: true, viewportFraction: 1),
      itemCount: bannerUrlItems.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Stack(
          children: [
            Image.asset(
              bannerUrlItems[index],
              fit: BoxFit.cover,
              width: appSize.width,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                color: Colors.black38,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${index + 1}/${bannerUrlItems.length}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
