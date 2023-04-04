import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

class TableViewDemo2 extends StatelessWidget {
  const TableViewDemo2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8,12,0,12),
            child: DataTable(
              dataRowHeight: 40,
              horizontalMargin : 16,
              columnSpacing : 16,
              dividerThickness: 0.7,
              showBottomBorder: true,
              decoration: const BoxDecoration(
                //color: Colors.blue.shade50,
                borderRadius: BorderRadius.all(Radius.circular(AppColor.appCornerRadius4)),
                // border: Border.all( color: Colors.grey, width: 0.5),
              ),
              headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              dataTextStyle: const TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
              dataRowColor: MaterialStateColor.resolveWith( (Set<MaterialState> states) => Colors.black12),
              headingRowColor: MaterialStateColor.resolveWith((states) => Colors.black26,),
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Player'),
                ),
                DataColumn(
                  label: Text('Team'),
                ),
                DataColumn(
                  label: Text('GP'),
                ),
                DataColumn(
                  label: Text('W'),
                ),
                DataColumn(
                  label: Text('L'),
                ),
                DataColumn(
                  label: Text('D'),),
              ],

              /*

              rows: DataRow.byIndex(
              cells:
              index: row.key,
              color: MaterialStateColor.resolveWith(
                    (states) {
                  if (row.key % 2 == 0) {
                    return Colors.blue[50];
                  } else {
                    return Colors.white;
                  }
                },
              ),
            ),

            */

              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Image.asset("assets/images/flags/in.png", width: 22,)),
                    const DataCell(Text('Chennai Super')),
                    const DataCell(Text('14')),
                    const DataCell(Text('9')),
                    const DataCell(Text('5')),
                    const DataCell(Text('0')),
                  ],
                ),

                DataRow(
                  cells: <DataCell>[
                    DataCell(Image.asset("assets/images/flags/ad.png", width: 22,)),
                    const DataCell(Text('Deccan Chargers')),
                    const DataCell(Text('23')),
                    const DataCell(Text('5')),
                    const DataCell(Text('3')),
                    const DataCell(Text('6')),
                  ],
                ),

                DataRow(
                  cells: <DataCell>[
                    DataCell(Image.asset("assets/images/flags/ae.png", width: 22,)),
                    const DataCell(Text('Delhi Capitals')),
                    const DataCell(Text('34')),
                    const DataCell(Text('4')),
                    const DataCell(Text('3')),
                    const DataCell(Text('1')),
                  ],
                ),

                DataRow(
                  cells: <DataCell>[
                    DataCell(Image.asset("assets/images/flags/bq.png", width: 22,)),
                    const DataCell(Text('Knight Riders')),
                    const DataCell(Text('44')),
                    const DataCell(Text('12')),
                    const DataCell(Text('5')),
                    const DataCell(Text('22')),
                  ],
                ),

                DataRow(
                  cells: <DataCell>[
                    DataCell(Image.asset("assets/images/flags/bn.png", width: 22,)),
                    const DataCell(Text('Mumbai Indians')),
                    const DataCell(Text('14')),
                    const DataCell(Text('9')),
                    const DataCell(Text('5')),
                    const DataCell(Text('0')),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}