import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

import '../LeagueTable/DataRowLeagueTableWidget.dart';

class TableViewDemo4 extends StatelessWidget {
  const TableViewDemo4({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
              child: DataTable(
                dataRowHeight: 45,
                horizontalMargin: 16,
                columnSpacing: 16,
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
                dataTextStyle: const TextStyle(fontStyle: FontStyle.normal, color: AppColor.black),
                dataRowColor: MaterialStateColor.resolveWith((Set<MaterialState> states) => Colors.grey.shade100,
                ),
                columns: <DataColumn>[
                  getDataColumnLeagueTableWidget("TEAM"),

                ],
                rows: <DataRow>[
                  getDataRowWidgetStats("GP"),
                  getDataRowWidgetStats("W"),
                  getDataRowWidgetStats("L"),
                  getDataRowWidgetStats("D"),
                  getDataRowWidgetStats("NR"),
                  getDataRowWidgetStats("P"),
                  getDataRowWidgetStats("NRR"),
                  getDataRowWidgetStats("WP"),
                  getDataRowWidgetStats("M"),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: DataTable(
                    dataRowHeight: 45,
                    horizontalMargin: 12,
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
                    dataRowColor: MaterialStateColor.resolveWith((Set<MaterialState> states) => Colors.white,
                    ),
                    columns: <DataColumn>[
                      getDataColumnLeagueTableWidget("KKR"),
                      getDataColumnLeagueTableWidget("RCB"),
                      getDataColumnLeagueTableWidget("DC"),
                      getDataColumnLeagueTableWidget("CSK"),
                      getDataColumnLeagueTableWidget("MI"),
                      getDataColumnLeagueTableWidget("PK"),
                      getDataColumnLeagueTableWidget("RR"),
                      getDataColumnLeagueTableWidget("SH"),
                      getDataColumnLeagueTableWidget("MI"),
                      getDataColumnLeagueTableWidget("RR"),
                      getDataColumnLeagueTableWidget("SH"),
                      getDataColumnLeagueTableWidget("MI"),
                    ],
                    rows: <DataRow>[
                      getDataRowLeagueTableWidget(),
                      getDataRowLeagueTableWidget(),
                      getDataRowLeagueTableWidget(),
                      getDataRowLeagueTableWidget(),
                      getDataRowLeagueTableWidget(),
                      getDataRowLeagueTableWidget(),
                      getDataRowLeagueTableWidget(),
                      getDataRowLeagueTableWidget(),
                      getDataRowLeagueTableWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
