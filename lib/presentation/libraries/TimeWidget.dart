import 'dart:async';

import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter/material.dart';

import '../widgets/txt.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({Key? key}) : super(key: key);

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  final ValueNotifier<String> _counter = ValueNotifier<String>("00:00");
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t){
      setState((){
        _counter.value = formatTimeFromSecond(t.tick);
        //debugPrint('---- : ${t.tick}');
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, String value, Widget? child) {  // widget under builder will rebuild
        // This builder will only get called when the _counter
        // is updated.
        return Txt(txt: value, txtColor: Colors.white, txtSize: 18, fontWeight: FontWeight.normal, padding: 0);
      },
      valueListenable: _counter,
    );
  }
}