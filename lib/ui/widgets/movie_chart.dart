import 'package:cgv_clone/data/model/movie.dart';
import 'package:cgv_clone/ui/movie/detail_screen.dart';
import 'package:cgv_clone/ui/widgets/movie_rank_poster.dart';
import 'package:flutter/material.dart';

class MovieChart extends StatelessWidget {
  const MovieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          movieList.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(thisMovie: movieList[index])),
              );
            },
            child: movieRankPoster(
              movieList[index],
            ),
          ),
        ),
      ),
    );
  }
}
