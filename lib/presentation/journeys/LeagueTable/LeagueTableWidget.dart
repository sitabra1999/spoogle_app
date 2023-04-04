import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/libraries/flutter_expandable_table/TableCellsWidget.dart';
import 'package:flutter_spoogle_app/presentation/libraries/flutter_expandable_table/ThemeConstants.dart';
import 'package:flutter_spoogle_app/presentation/widgets/AppWidget/SpoogleWatermarkWidget.dart';

import '../../libraries/flutter_expandable_table/flutter_expandable_table.dart';

class LeagueTableWidget extends StatefulWidget {
  const LeagueTableWidget({Key? key}) : super(key: key);

  @override
  State<LeagueTableWidget> createState() => _LeagueTableWidgetState();
}

class _LeagueTableWidgetState extends State<LeagueTableWidget> {
  ExpandableTable _buildSimpleTable() {
    List<String> firstColumnTitleList = ["GP", "W", "L", "KT", "NP","GP", "W", "L", "KT", "NP","GP", "W", "L", "KT", "NP","GP", "W", "L", "KT", "NP",];
    List<String> firstRowTitleList = ["DC", "CSK", "KKR", "MI", "RR","DC", "CSK", "KKR", "MI", "RR","DC", "CSK", "KKR", "MI", "RR","DC", "CSK", "KKR", "MI", "RR",];

    //Creation header
    ExpandableTableHeader header = ExpandableTableHeader(
      firstCell: const TableCellsWidget(text: 'TEAM', textStyle: textStyleTitle, cellType: "RowTitle"),
      children: List.generate(
        firstRowTitleList.length - 1,
        (index) => TableCellsWidget(text: firstRowTitleList[index], textStyle: textStyleTitle, cellType: "RowTitle"),
      ),
    );

    // Creation rows
    List<ExpandableTableRow> rows = List.generate(
      firstRowTitleList.length,
      (rowIndex) => ExpandableTableRow(
        height: 40,
        firstCell: TableCellsWidget(text: firstColumnTitleList[rowIndex], textStyle: textStyleTitle, cellType: "ColumnTitle"),
        children: List<Widget>.generate(
          firstColumnTitleList.length - 1,
          (columnIndex) => TableCellsWidget(text: '$rowIndex$columnIndex', textStyle: textStyleCells, cellType: "Score"),
        ),
      ),
    );

    return ExpandableTable(
      cellHeight: 40,
      cellWidth: 65,
      headerHeight: 45,
      firstColumnWidth: 85,
      rows: rows,
      header: header,
      scrollShadowColor: accentColor,
    );
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Future.delayed(const Duration(milliseconds: 300)).then((value){
        setState(() {
          _buildSimpleTable();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SpoogleWatermarkWidget(
      child: _buildSimpleTable(),
    );
  }
}
