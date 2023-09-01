import 'package:cgv_clone/data/seat_status.dart';
import 'package:flutter/material.dart';

class SeatSelection extends StatefulWidget {
  @override
  _SeatSelectionState createState() => _SeatSelectionState();
}

class _SeatSelectionState extends State<SeatSelection> {
  List<Seat> seats = List.generate(
    100,
    (index) => Seat(
        row: index ~/ 10 + 1,
        number: index % 10 + 1,
        status: SeatStatus.available),
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey[300],
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10,
            childAspectRatio: 1,
          ),
          itemCount: seats.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (seats[index].status == SeatStatus.available) {
                  setState(() {
                    seats[index].status = SeatStatus.selected;
                  });
                } else if (seats[index].status == SeatStatus.selected) {
                  setState(() {
                    seats[index].status = SeatStatus.available;
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1), // 테두리 스타일
                  borderRadius: BorderRadius.circular(4.0), // 모서리 둥글게 처리
                  color: _getColor(seats[index].status),
                ),
                margin: const EdgeInsets.all(2.0),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Color _getColor(SeatStatus status) {
    switch (status) {
      case SeatStatus.available:
        return Colors.grey;
      case SeatStatus.reserved:
        return Colors.grey;
      case SeatStatus.selected:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
