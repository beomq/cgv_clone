import 'package:cgv_clone/data/model/movie.dart';
import 'package:cgv_clone/ui/reserve/reserve_screen.dart';
import 'package:flutter/material.dart';

Widget movieRankPoster(BuildContext context, Movie movie) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                movie.imageUrl,
                fit: BoxFit.contain,
                width: 130,
              ),
            ),
            Positioned(
              left: 2,
              bottom: -8,
              child: Text(
                movie.rank.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 40,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          color: Colors.black54,
                          offset: Offset(2, 2),
                          blurRadius: 4),
                    ]),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          movie.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          '관람객 평점: ${movie.rating}',
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReserveScreen(
                  movie: movie,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              minimumSize: const Size(100, 15),
              side: const BorderSide(color: Colors.black)),
          child: const Text(
            '지금예매',
            style: TextStyle(color: Colors.black, fontSize: 10),
          ),
        )
      ],
    ),
  );
}
