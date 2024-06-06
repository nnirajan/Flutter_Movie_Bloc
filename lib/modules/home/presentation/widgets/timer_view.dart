import 'package:flutter/material.dart';

class TimerView extends StatelessWidget {
  const TimerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.timer_rounded,
          size: 18,
          // color: Colors.yellow,
        ),
        const SizedBox(width: 2),
        Text(
          maxLines: 1,
          "1h 47m",
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
