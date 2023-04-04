import 'package:flutter/material.dart';


DataColumn getDataColumnLeagueTableWidget(String columnName){
  return DataColumn(
    label: Center(child: Text(columnName, style: const TextStyle(fontSize: 14),)),
  );
}

DataRow getDataRowLeagueTableWidget(){
  return const DataRow(
    cells: <DataCell>[
      DataCell(Center(child: Text('14'))),
      DataCell(Center(child: Text('9'))),
      DataCell(Center(child: Text('5'))),
      DataCell(Center(child: Text('0'))),
      DataCell(Center(child: Text('22'))),
      DataCell(Center(child: Text('5'))),
      DataCell(Center(child: Text('0'))),
      DataCell(Center(child: Text('22'))),
      DataCell(Center(child: Text('5'))),
      DataCell(Center(child: Text('0'))),
      DataCell(Center(child: Text('5'))),
      DataCell(Center(child: Text('0'))),
    ],
  );
}

DataRow getDataRowWidgetStats(String txt){
  return DataRow(
    cells: <DataCell>[
      DataCell(Center(child: Text(txt))),
    ],
  );
}
