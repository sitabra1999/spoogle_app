import 'package:flutter/material.dart';

import 'AppLocalizations.dart';

extension StringExtension on String {
  String intelliTrim() {
    return length > 100 ? '${substring(0, 100)}...' : this;
  }

  String t(BuildContext context) {
    return AppLocalizations.of(context)?.translate(this) ?? '';
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
