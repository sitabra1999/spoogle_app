import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

import '../LeagueTable/DataRowLeagueTableWidget.dart';


class TableViewDemo1 extends StatelessWidget {
  const TableViewDemo1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
          child: DataTable(
            dataRowHeight: 50,
            horizontalMargin: 16,
            columnSpacing: 24,
            dividerThickness: 0.7,
            showBottomBorder: true,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppColor.appCornerRadius4),
                bottomLeft: Radius.circular(AppColor.appCornerRadius4),
              ),
              // border: Border.all( color: Colors.grey, width: 0.5),
            ),
            dataTextStyle: const TextStyle(fontStyle: FontStyle.italic, color: AppColor.black),
            dataRowColor: MaterialStateColor.resolveWith(
              (Set<MaterialState> states) => Colors.grey.shade50,
            ),
            columns: <DataColumn>[
              getDataColumnLeagueTableWidget("TEAM"),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Image.asset(
                    "assets/images/flags/in.png",
                    width: 22,
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Image.asset(
                    "assets/images/flags/ad.png",
                    width: 22,
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Image.asset(
                    "assets/images/flags/ae.png",
                    width: 22,
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Image.asset(
                    "assets/images/flags/bq.png",
                    width: 22,
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Image.asset(
                    "assets/images/flags/bn.png",
                    width: 22,
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Image.asset(
                    "assets/images/flags/bw.png",
                    width: 22,
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Image.asset(
                    "assets/images/flags/bz.png",
                    width: 22,
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Image.asset(
                    "assets/images/flags/bg.png",
                    width: 22,
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Image.asset(
                    "assets/images/flags/bf.png",
                    width: 22,
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Image.asset(
                    "assets/images/flags/at.png",
                    width: 22,
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Image.asset(
                    "assets/images/flags/ao.png",
                    width: 22,
                  )),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: DataTable(
                dataRowHeight: 50,
                horizontalMargin: 8,
                columnSpacing: 16,
                dividerThickness: 0.7,
                showBottomBorder: true,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(AppColor.appCornerRadius4),
                    bottomRight: Radius.circular(AppColor.appCornerRadius4),
                  ),
                  // border: Border.all( color: Colors.grey, width: 0.5),
                ),
                dataTextStyle: const TextStyle(fontStyle: FontStyle.italic, color: AppColor.black70),
                dataRowColor: MaterialStateColor.resolveWith(
                  (Set<MaterialState> states) => Colors.white,
                ),
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text('TEAM'),
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
                    label: Text('D'),
                  ),
                  DataColumn(
                    label: Text('NR'),
                  ),
                  DataColumn(
                    label: Text('P'),
                  ),
                  DataColumn(
                    label: Text('NRR'),
                  ),
                  DataColumn(
                    label: Text('W'),
                  ),
                  DataColumn(
                    label: Text('AVG'),
                  ),
                  DataColumn(
                    label: Text('O'),
                  ),
                  DataColumn(
                    label: Text('R'),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Chennai Super Kings')),
                      DataCell(Text('14')),
                      DataCell(Text('9')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                    ],
                  ),
                  DataRow(
                    selected: true,
                    cells: <DataCell>[
                      DataCell(Text('Royal Challengers Bangalore')),
                      DataCell(Text('23')),
                      DataCell(Text('5')),
                      DataCell(Text('3')),
                      DataCell(Text('6')),
                      DataCell(Text('43')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                      placeholder: true,
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Chennai Super Kings' , style: TextStyle(color: Colors.blue),),
                        ),
                      ),
                      DataCell(Text('34')),
                      DataCell(Text('4')),
                      DataCell(Text('3')),
                      DataCell(Text('1')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Mumbai Indians')),
                      DataCell(Text('44')),
                      DataCell(Text('12')),
                      DataCell(Text('5')),
                      DataCell(Text('22')),
                      DataCell(Text('44')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Kolkata Knight Riders')),
                      DataCell(Text('14')),
                      DataCell(Text('9')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Punjab Kings' , style: TextStyle(color: Colors.blue),)),
                      DataCell(Text('14')),
                      DataCell(Text('9')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Rajasthan Royals')),
                      DataCell(Text('14')),
                      DataCell(Text('9')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Deccan Chargers')),
                      DataCell(Text('14')),
                      DataCell(Text('9')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Kochi Tuskers Kerala')),
                      DataCell(Text('14')),
                      DataCell(Text('9')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Pune Warriors India')),
                      DataCell(Text('14')),
                      DataCell(Text('9')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Delhi Capitals')),
                      DataCell(Text('14')),
                      DataCell(Text('9')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                      DataCell(Text('5')),
                      DataCell(Text('0')),
                      DataCell(Text('22')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
