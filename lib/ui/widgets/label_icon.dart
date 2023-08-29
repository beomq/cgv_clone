import 'package:flutter/material.dart';

class LabelIcon extends StatelessWidget {
  const LabelIcon({Key? key, required this.icon, required this.label})
      : super(key: key);

  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black12,
          ),
          child: icon,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
