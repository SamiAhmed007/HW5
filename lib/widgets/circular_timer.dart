import 'package:flutter/material.dart';

class CircularTimer extends StatelessWidget {
  final int remainingTime;

  const CircularTimer({Key? key, required this.remainingTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(
            value: remainingTime / 10,
            strokeWidth: 8,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              remainingTime > 5 ? Colors.green : Colors.red,
            ),
          ),
        ),
        Text(
          remainingTime.toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
