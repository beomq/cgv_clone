enum SeatStatus { available, reserved, selected }

class Seat {
  final int row;
  final int number;
  SeatStatus status;

  Seat({required this.row, required this.number, required this.status});
}
