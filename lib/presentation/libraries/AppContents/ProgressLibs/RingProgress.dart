import 'package:flutter/material.dart';


class RingProgress extends StatelessWidget {
  final double progress;
  final Function() onPressed;

  const RingProgress({
    Key? key,
    required this.progress,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment : AlignmentDirectional.center,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 60,
          child: Center(
            child: Text(
              'Credit Utilize\n30%',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold ),
            ),
          ),
        ),
        const SizedBox(
          width: 75,
          height: 75,
          child:  CircularProgressIndicator(
            color: Colors.black12,
            value: 1,
          ),
        ),
        SizedBox(
          width: 75,
          height: 75,
          child: CircularProgressIndicator(
            color: Colors.cyan,
            value: progress, // Change this value to update the progress
          ),
        ),
      ],
    );
  }
}
