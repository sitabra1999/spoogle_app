
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/AppConstants.dart';
import 'package:flutter_spoogle_app/common/extensions/DateExtension.dart';

import '../../../themes/app_color.dart';

class DatePickerTitle extends StatelessWidget {
  const DatePickerTitle({
    required this.date,
    super.key,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 16),
        alignment: Alignment.centerLeft,
        child: Text(
          date.format(kMonthFormatWidthYear),
          style: const TextStyle(
            fontSize: 21,
            color: AppColor.violet,
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}
