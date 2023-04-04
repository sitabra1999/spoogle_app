import 'package:flutter/material.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
