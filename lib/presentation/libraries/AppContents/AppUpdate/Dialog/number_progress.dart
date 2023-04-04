import 'package:flutter/material.dart';


class NumberProgress extends StatelessWidget {
  final double height;
  final double value;
  final Color? backgroundColor;
  final Color valueColor;
  final Color textColor;
  final double textSize;
  final AlignmentGeometry textAlignment;
  final EdgeInsetsGeometry padding;

  const NumberProgress(
      {Key? key,
        this.height = 10.0,
        this.value = 0.0,
        this.backgroundColor,
        this.valueColor = Colors.blue,
        this.textColor = Colors.white,
        this.textSize = 8.0,
        this.padding = EdgeInsets.zero,
        this.textAlignment = Alignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              height: height,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(height)),
                child: LinearProgressIndicator(
                  value: value,
                  backgroundColor: backgroundColor,
                  valueColor: AlwaysStoppedAnimation<Color>(valueColor),
                ),
              ),
            ),
            Container(
              height: height,
              alignment: textAlignment,
              child: Text(
                value >= 1 ? '100%' : '${(value * 100).toInt()}%',
                style: TextStyle(
                  color: textColor,
                  fontSize: textSize,
                ),
              ),
            ),
          ],
        ));
  }
}