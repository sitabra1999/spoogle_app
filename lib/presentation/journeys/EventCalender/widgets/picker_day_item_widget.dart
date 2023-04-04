import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';

import '../../../themes/app_color.dart';


/// Widget of day item cell for range picker.
class PickerDayItemWidget extends StatelessWidget {
  const PickerDayItemWidget({
    required this.properties,
    super.key,
  });

  final DayItemProperties properties;

  @override
  Widget build(BuildContext context) {
    /// Lock aspect ratio of items to be rectangle.
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Stack(
        children: [
          /// Semi transparent violet background for days in selected range.
          if (properties.isInRange)

            /// For first and last days in range background color visible only
            /// on one side.
            Row(
              children: [
                Expanded(
                    child: Container(
                        color: properties.isFirstInRange
                            ? Colors.transparent
                            : AppColor.violet.withOpacity(0.4))),
                Expanded(
                    child: Container(
                        color: properties.isLastInRange
                            ? Colors.transparent
                            : AppColor.violet.withOpacity(0.4))),
              ],
            ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: properties.isFirstInRange ||
                      properties.isLastInRange ||
                      properties.isSelected
                  ? AppColor.violet
                  : Colors.transparent,
            ),
            child: Center(
              child: Text('${properties.dayNumber}',
                  style: TextStyle(
                      color: properties.isInRange || properties.isSelected
                          ? Colors.white
                          : AppColor.violet
                              .withOpacity(properties.isInMonth ? 1 : 0.5))),
            ),
          ),
        ],
      ),
    );
  }
}
