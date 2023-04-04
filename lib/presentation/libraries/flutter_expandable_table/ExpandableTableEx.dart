import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/libraries/flutter_expandable_table/TableCellsWidget.dart';
import 'package:flutter_spoogle_app/presentation/libraries/flutter_expandable_table/ThemeConstants.dart';
import 'package:flutter_spoogle_app/presentation/widgets/AppWidget/SpoogleWatermarkWidget.dart';

import '../../libraries/flutter_expandable_table/flutter_expandable_table.dart';

ExpandableTable buildExpandableTable() {
  const int COLUMN_COUNT = 20;
  const int SUB_COLUMN_COUNT = 5;
  const int ROW_COUNT = 6;

  //Creation header
  ExpandableTableHeader subHeader = ExpandableTableHeader(
    firstCell: Container(
        color: primaryColor,
        margin: const EdgeInsets.all(1),
        child: const Center(
            child: Text(
              'Expandable Column',
              style: textStyleSubItems,
            ))),
    children: List.generate(
      SUB_COLUMN_COUNT,
          (index) => Container(
        color: primaryColor,
        margin: const EdgeInsets.all(1),
        child: Center(
          child: Text(
            'Sub Column $index',
            style: textStyleSubItems,
          ),
        ),
      ),
    ),
  );

  //Creation header
  ExpandableTableHeader header = ExpandableTableHeader(
    firstCell: Container(
        color: primaryColor,
        margin: const EdgeInsets.all(1),
        child: const Center(
            child: Text(
              'Expandable\nTable',
              style: textStyleCells,
            ))),
    children: List.generate(
      COLUMN_COUNT - 1,
          (index) => index == 6
          ? subHeader
          : Container(
        color: primaryColor,
        margin: const EdgeInsets.all(1),
        child: Center(
          child: Text(
            'Column $index',
            style: textStyleCells,
          ),
        ),
      ),
    ),
  );

//Creation sub rows
  List<ExpandableTableRow> subTows1 = List.generate(
    ROW_COUNT,
        (rowIndex) => ExpandableTableRow(
      height: 30,
      firstCell: Container(
          color: primaryColor,
          margin: const EdgeInsets.all(1),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Sub Sub Row $rowIndex',
              style: textStyleSubItems,
            ),
          )),
      children: List<Widget>.generate(
        COLUMN_COUNT + SUB_COLUMN_COUNT - 1,
            (columnIndex) => Container(
          color: primaryColor,
          margin: const EdgeInsets.all(1),
          child: Center(
            child: Text(
              'Cell $rowIndex:$columnIndex',
              style: textStyleSubItems,
            ),
          ),
        ),
      ),
    ),
  );
  List<ExpandableTableRow> subTows = List.generate(
      ROW_COUNT,
          (rowIndex) => ExpandableTableRow(
          height: 50,
          firstCell: Container(
            color: primaryColor,
            margin: const EdgeInsets.all(1),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Sub Row $rowIndex',
                  style: textStyleSubItems,
                ),
              ),
            ),
          ),
          children: subTows1,
          legend: Container(
            color: primaryColor,
            margin: const EdgeInsets.all(1),
            child: const Center(
              child: Text(
                'Expandible sub Row...',
                style: textStyleCells,
              ),
            ),
          )));

  //Creation rows
  List<ExpandableTableRow> rows = List.generate(
    ROW_COUNT,
        (rowIndex) => ExpandableTableRow(
      height: 50,
      firstCell: Container(
          color: primaryColor,
          margin: const EdgeInsets.all(1),
          child: Center(
              child: Text(
                'Row $rowIndex',
                style: textStyleCells,
              ))),
      legend: rowIndex == 0
          ? Container(
        color: primaryColor,
        margin: const EdgeInsets.all(1),
        child: const Center(
          child: Text(
            'Expandible Row...',
            style: textStyleCells,
          ),
        ),
      )
          : null,
      children: rowIndex == 0
          ? subTows
          : List<Widget>.generate(
        COLUMN_COUNT + SUB_COLUMN_COUNT - 1,
            (columnIndex) => Container(
          color: primaryColor,
          margin: const EdgeInsets.all(1),
          child: Center(
            child: Text(
              'Cell $rowIndex:$columnIndex',
              style: textStyleCells,
            ),
          ),
        ),
      ),
    ),
  );

  return ExpandableTable(
    rows: rows,
    header: header,
    scrollShadowColor: accentColor,
  );
}