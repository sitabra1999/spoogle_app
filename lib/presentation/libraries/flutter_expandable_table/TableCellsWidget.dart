import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';


class TableCellsWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final String cellType;
  const TableCellsWidget({Key? key, required this.text, required this.textStyle, required this.cellType}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      // margin: margin
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: getColor(),
        border: Border.all(color: Colors.grey, width: 0.1),
        /*
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12.0,
              offset: Offset(5.0, 5.0),
            ),
          ]*/
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }

  Color getColor() {
    Color color = Colors.white;
    switch(cellType){
      case "RowTitle" :
        color = Colors.blue.shade50;
        break;

      case "ColumnTitle" :
        color = AppColor.black10;
        break;

      case "Score" :
        color = Colors.transparent;
        break;
    }
    return color;
  }
}
