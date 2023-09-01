import 'package:cgv_clone/ui/widgets/seat_section.dart';
import 'package:flutter/material.dart';
import 'package:cgv_clone/data/model/movie.dart';

class ReserveScreen extends StatelessWidget {
  final Movie movie;

  const ReserveScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('영화 "${movie.title}"의 예약을 진행해주세요.'),
              SeatSelection(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    minimumSize: const Size(100, 15),
                    side: const BorderSide(color: Colors.black)),
                child: const Text(
                  '지금예매',
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
