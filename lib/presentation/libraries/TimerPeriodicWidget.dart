import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/txt.dart';

class TimerPeriodicWidget extends StatefulWidget {
  const TimerPeriodicWidget({Key? key}) : super(key: key);

  @override
  State<TimerPeriodicWidget> createState() => _TimerPeriodicWidgetState();
}

class _TimerPeriodicWidgetState extends State<TimerPeriodicWidget> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

  int currentSeconds = 0;

  String get timerText => '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout() {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        debugPrint("Timer.tick: ${timer.tick}");
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(right: 90, top: 46),
          child: Icon(
            Icons.timer_outlined,
            color: Colors.white,
            size: 35,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 35, top: 50),
          child: Txt(txt: timerText, txtColor: Colors.white, txtSize: 24, fontWeight: FontWeight.bold, padding: 0),
        ),
      ],
    );
  }
}