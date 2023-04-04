import 'package:flutter/material.dart';

import 'easy_search_bar.dart';

PreferredSizeWidget appBarEasySearchCalenderView({
  required BuildContext context,
  required bool isCalenderEnabled,
  required Widget searchWidget,
  required Function(String value) onTapOnSearch,
  required Function() onTapOnChangeView,
}) {
  return EasySearchBar(
    title: const Text('Example'),
    onSearch: (value) {
      onTapOnSearch(value);
    },
    actions: [
      searchWidget,
      IconButton(
        icon: const Icon(
          Icons.search,
          color: Colors.black,
          //size: 22,
        ),
        onPressed: () {
          //onTapOnSearch("");
        },
      ),
      IconButton(
        padding: const EdgeInsets.only(right: 8),
        icon: Icon(
          isCalenderEnabled ? Icons.grid_view_rounded : Icons.view_list_rounded,
          color: Colors.black,
          size: 26,
        ),
        onPressed: () {
          onTapOnChangeView();
        },
      ),
    ],
    //asyncSuggestions: (value) async => await _fetchSuggestions(value)
  );
}
